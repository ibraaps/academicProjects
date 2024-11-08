var snmp = require ("net-snmp");
var TelegramBot = require('node-telegram-bot-api');
const { createCanvas } = require('canvas');
//const Chart = require('chart.js').default;
const Chart = require('chart.js/auto');
const fs = require('fs');


// Define BothFather Token
var token = '';


// Create a TelegramBot instance
var bot = new TelegramBot(token, { polling: true });

/**
* Command /start
* Show the list of commands available to the bot
**/
bot.onText(/\/(start|help)/, function (msg, match) {
    var chatId = msg.chat.id;

    var resp = "Comandos disponibles:\n";
    resp += "/start - Mostrar este mensaje de ayuda\n";
    resp += "/scan - Busqueda dispositivos SNMP\n";
    resp += "/session - Conexion con dispositivo SNMP\n";
    resp += '/commands - Mostrar lista de comandos\n';

    // send back the matched "whatever" to the chat
    bot.sendMessage(chatId, resp);
});

// Listen for any kind of message. There are different kinds of
// messages.
bot.on('message', function (msg) {

    switch (getCommand()) {
        case 'scan':
            //Ver si comentado o no
            commandSession(chatId, msg.text);
            setCommand();
        case 'session':
            commandSession(chatId, msg.text);
            setCommand();
        break;
            default:
            break;
    }

    // send a message to the chat acknowledging receipt of their message
    //bot.sendMessage(chatId, "Received your message");
});


/**
* Snmp Session Setter
**/
var setSession = function(session)
{
    this.session = session;
};

/**
* Snmp Session Getter
**/
var getSession = function() {
    return this.session;
};

/**
* Set current command
**/
var setCommand = function(command) {
    this.command = command;
};

/**
* Get current command
**/
var getCommand = function() {
    return this.command;
}

/**
* Set current ChatId
**/
function setChatId(chatId) {
    this.chatId = chatId;
}

/**
* Get current ChatId
**/
function getChatId()
{
    return this.chatId;
}

/**
* Load Buttons
**/
function loadButtons() {
    var options = {
        reply_markup: JSON.stringify({
            inline_keyboard: [
                [{ text: 'Consultar OID conocida', callback_data: 'getconsulta' }],
                [{ text: 'Datos del equipo', callback_data: 'getdata' }],
                [{ text: 'Cambiar nombre persona contacto', callback_data: 'setsyscontact' }],
                [{ text: 'CPU', callback_data: 'cpu' }],
                [{ text: 'Tabla direcciones IP', callback_data: 'tablaip' }],
                [{ text: 'Uptime', callback_data: 'uptime' }],
                [{ text: 'Desactivar', callback_data: 'desactivar' }],
                [{ text: 'SWInstalled', callback_data: 'swinstalled' }],
                [{ text: 'NumOctetos', callback_data: 'numoctetos' }]
            ]
        })
    };
    bot.sendMessage(getChatId(), 'Seleciona la opción que desee mostrar:', options).then(function (sended) {
        // `sended` is the sent message.
    });
}

/**
* Show a default buttons options
**/
bot.onText(/\/commands/, function (msg, match) {
    loadButtons();
});

/**
* Receive a button callback
**/
bot.on('callback_query', function (msg) {
    setChatId(msg.message.chat.id);
    setCommand(msg.data);
    bot.sendMessage(getChatId(), 'Procesando, espere...').then(function (sended) {
        switch (msg.data) {
            case 'getconsulta':
                bot.sendMessage(chatId, 'Por favor, escribe el OID que desea consultar:');
                bot.once('message', (msg) => {
                const oid = msg.text.toString();
                getConsulta([oid]);
                setCommand();
                 });
                
                setCommand();
                break;
            case 'getdata':
                getData();
                setCommand();
                break;
            case 'setsyscontact':
                
                bot.sendMessage(chatId, 'Por favor, escribe el nuevo nombre de contacto:');
                bot.once('message', (msg) => {
                const parametro = msg.text;
                setsyscontact(parametro);
                bot.sendMessage(chatId, `El nuevo nombre de contacto es: ${parametro}`);
                setCommand();
                 });
                
                break;
            case 'cpu':
                cpu();
                setCommand();
                break;
            case 'tablaip':
                tablaip();
                setCommand();
                break;
            case 'uptime':
                uptime();
                setCommand();
                break;
            case 'desactivar':
                 desactivar();
                 setCommand();
                break;
            case 'swinstalled':
                SWInstalled();
                setCommand();
                break;
            case 'numoctetos':
                bot.sendMessage(chatId, 'Se va a monitorizar el trafico de paquetes entrantes y salientes durante 2 min:');
                numOctetos();
                //numOctetos2();
                //getOidNumOctetosentrantes();
                //getOidNumOctetos();
                setCommand();
                break;
            default:
            break;
        }
    });
});

/**
* Get tablaip info
**/
function getData() {
    console.log('obteniendo datos del equipo');
    var msg = "Datos del equipo:\n\n";
    var i = 0;
    var desc = ['Persona contacto: ',
                'Nombre equipo: ',
                'Localizacion: '];


    getOid(['1.3.6.1.2.1.1.4.0', '1.3.6.1.2.1.1.5.0', '1.3.6.1.2.1.1.6.0'], function(data) {
        

        msg += desc[i]+(data)+" \n";
        if( i == desc.length - 1 )
        {
            bot.sendMessage(getChatId(), msg);
        }
        i = i+1;


    });
}

/**
* Set syscontact
**/
function setsyscontact(valor) {
    console.log('set syscontact');
    var msg = "SetsysContact:";
    var oid = "1.3.6.1.2.1.1.4.0";
    setOid(oid, valor, function(data) {        
            bot.sendMessage(getChatId(),msg +" "+valor+"\n");                
    });

}


/**
* Get CPU info
**/
function cpu() {
    console.log('CPU load');
    var msg = "Tabla de porcentaje de procesador:\n\n";
    var i = 0;
    var desc = ['CPU Core 1: ',
                'CPU Core 2: ',
                'CPU Core 3: ',
                'CPU Core 4: ',
                'CPU Core 5: ',
                'CPU Core 6: ',
                'CPU Core 7: ',
                'CPU Core 8: '];
        
                
    var oid = ['1.3.6.1.2.1.25.3.3.1.2'];
    var nonRepeaters = 0;
    var maxRepetitions = 8;
    var valormedio = 0;
    getBulkOid(oid,nonRepeaters,maxRepetitions, function(data) {
        var partes = data.split("|");
        var datos1 = partes[1];

        valormedio = valormedio + (datos1 / 100);

        msg += desc[i]+(datos1)+"% \n";
        if( i == desc.length - 1 )
        {
            bot.sendMessage(getChatId(), msg +"\n Valor medio de la CPU: "+(valormedio/8)*100+"%");
        }
        i = i+1;
       //bot.sendMessage(getChatId(), "Valor CPU:"+ data);
    });
}

/**
* Get tablaip info
**/
function tablaip() {
    console.log('procesando tabla direcciones ip');
    var msg = "Tabla de direcciones IP:\n\n";
    var i = 0;
    var desc = ['ipAd1: ',
                'ipAd2: ',
                'ipAd3: ',
                'ipAd4: '];

    var nonRepeaters = 0;
    var maxRepetitions = 4;
    getBulkOid(['1.3.6.1.2.1.4.20.1.1'], nonRepeaters, maxRepetitions, function(data) {
        var partes = data.split("|");
        var datos1 = partes[1]; 

        msg += desc[i]+(datos1)+" \n";
        if( i == desc.length - 1 )
        {
            bot.sendMessage(getChatId(), msg);
        }
        i = i+1;


    });
}

/**
* Get uptime info
**/
function uptime() {
    console.log('funcion uptime');
    var msg = "UPTIME:\n\n";
    getOid(['1.3.6.1.2.1.1.3.0'], function(data) {

        var seconds = Math.round(data/100);
        var minutes = Math.round(seconds/60);
        var hours = Math.round(minutes/60);

        // Calcula los minutos y segundos restantes
        minutes = minutes % 60;
        seconds = seconds % 60;
        var time = hours+' horas, '+minutes+' minutos, '+seconds +" segundos";

        msg += 'Uptime: '+time+"\n";
        bot.sendMessage(getChatId(), msg);
    });
}

/**
* Desactivar tarjeta red
**/
function desactivar(valor) {
  console.log('funcion desactivar');
  var oid = "1.3.6.1.2.1.2.2.1.7.3";
  var msg = "Desactivado: ";
  setOid(oid, valor, function(data) {
          bot.sendMessage(getChatId(),msg +" "+valor+"\n");     
  });
}

function setsyscontact(valor) {
  console.log('set syscontact');
  var msg = "SetsysContact:";
  var oid = "1.3.6.1.2.1.1.4.0";
  setOid(oid, valor, function(data) {        
          bot.sendMessage(getChatId(),msg +" "+valor+"\n");                
  });

}
/**
* Get SWInstalled 
**/
function SWInstalled() {
  console.log('funcion SWInstalled');

  // Borramos el contenido del archivo
    fs.writeFile('./software.txt', '', function(err) {
    if (err) {
      console.log('Error al borrar el archivo:', err);
    } else {
      console.log('Contenido del archivo borrado');
    }
  });
  var nonRepeaters = 0;
  var maxRepetitions = 400;

  var promises = [];
  
  
    // Crea una nueva Promise que se resuelve cuando se recibe la respuesta de getBulkOid
    var promise = new Promise((resolve, reject) => {
      getBulkOid(['1.3.6.1.2.1.25.6.3.1.2'], nonRepeaters, maxRepetitions, function(data) {
        var partes = data.split("|");
        var datos1 = partes[1];
        //Si el contenido está vacío no se guarda en el archivo
        if(datos1 != '0.0'){
        fs.writeFile('software.txt', datos1+"\n", {flag: 'a'}, function(err) {
          if (err) {
            console.log(err);
            reject(err);
          } else {
            console.log('El archivo software.txt ha sido actualizado');
            resolve(datos1);
          }
        });
        }
      });
    });

    promises.push(promise);

    // Espera a que todas las Promises se resuelvan antes de continuar
    Promise.all(promises).then(values => {
      // Envía el archivo de software al bot de Telegram
      bot.sendMessage(getChatId(), "El documento generado es:\n");
      bot.sendDocument(chatId, "./software.txt")
      .then(function (response) {
        console.log('El documento ha sido enviado con éxito:', response);
      })
      .catch(function (error) {
        console.log('Error al enviar el documento:', error);
      });
    });
}



/**
* Get numoctetos 
**/

/*function numOctetos() {
    console.log('funcion numOctetos');
    var msg = "Número de paquetes entrantes: ";
    var msg2 = "Número de paquetes salientes: ";
    var oid = ['1.3.6.1.2.1.2.2.1.11.45'];
    var oidOut = ['1.3.6.1.2.1.2.2.1.17.45'];
    var repetitions = 12; // 12 repeticiones de 10 segundos = 2 minutos
    var dataArray = [];
    var labelsArray = [];
    var labelsArray1 = [];
    var dataArrayOut = [];

  
    var intervalId = setInterval(function() {
  
      getOid(oid, function(data) {
        dataArray.push(data);
        var currentDate = new Date();
        //bot.sendMessage(getChatId(), msg+data);
        labelsArray.push(currentDate.getHours() + ":" + currentDate.getMinutes() + ":" + currentDate.getSeconds());
      });

      getOid(oidOut, function(dataOut) {
        dataArrayOut.push(dataOut);
        var currentDate1 = new Date();
        //bot.sendMessage(getChatId(), msg2+data);
        labelsArray1.push(currentDate1.getHours() + ":" + currentDate1.getMinutes() + ":" + currentDate1.getSeconds());
      });

      
      repetitions--;
      if (repetitions === 0) {
        clearInterval(intervalId);
  
        // Crear gráfica
        const canvas = createCanvas(600, 400);
        const ctx = canvas.getContext('2d');
        const chart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: labelsArray,
            datasets: [{
              label: 'Paquetes entrantes',
              data: dataArray,
              borderColor: 'blue',
              borderWidth: 1
            }]
          },
          options: {
            scales: {
              y: {
                ticks: {
                  beginAtZero: true
                }
              }
            }
          }
        });

        // Crear gráfica
        const canvas1 = createCanvas(600, 400);
        const ctx1 = canvas1.getContext('2d');
        const chart2 = new Chart(ctx1, {
            type: 'line',
            data: {
              labels: labelsArray1,
              datasets: [{
                  label: 'Paquetes salientes',
                  data: dataArrayOut,
                  borderColor: 'red',
                  borderWidth: 1
                }]
            },
            options: {
              scales: {
                y: {
                  ticks: {
                    beginAtZero: true
                  }
                }
              }
            }
          });
  
        // Obtener imagen de la gráfica como un buffer de PNG
        const buffer = canvas.toBuffer('image/png');
        // Obtener imagen de la gráfica como un buffer de PNG
        const buffer2 = canvas1.toBuffer('image/png');
  
        // Enviar imagen de la gráfica como un mensaje de foto en Telegram
        bot.sendPhoto(getChatId(), buffer);
        // Enviar imagen de la gráfica como un mensaje de foto en Telegram
        bot.sendPhoto(getChatId(), buffer2);
  
        // Eliminar la instancia de la gráfica para evitar fugas de memoria
        chart.destroy();
        // Eliminar la instancia de la gráfica para evitar fugas de memoria
        chart2.destroy();
      }
    }, 10000); // intervalo de 10 segundos
}
  
*/
/*
function numOctetos2() {
  console.log('funcion numOctetos');
  var msg = "Número de paquetes entrantes: ";
  var msg2 = "Número de paquetes salientes: ";
  var oid = ['1.3.6.1.2.1.2.2.1.11.45'];
  var oidOut = ['1.3.6.1.2.1.2.2.1.17.45'];
  var repetitions = 12; // 12 repeticiones de 10 segundos = 2 minutos
  var dataArray = [];
  var labelsArray = [];
  var labelsArray1 = [];
  var dataArrayOut = [];
  var previousValue = 0; // Variable para almacenar el valor anterior
  var previousValueOut = 0; // Variable para almacenar el valor anterior

  var intervalId = setInterval(function() {

    getOid(oid, function(data) {
      var currentValue = data;
      if (previousValue !== 0) {
        dataArray.push(currentValue - previousValue); // Restar el valor anterior al valor actual
        var currentDate = new Date();
        labelsArray.push(currentDate.getHours() + ":" + currentDate.getMinutes() + ":" + currentDate.getSeconds());
      }
      previousValue = currentValue; // Actualizar el valor anterior
    });

    getOid(oidOut, function(dataOut) {
      var currentValueOut = dataOut;
      if (previousValueOut !== 0) {
        dataArrayOut.push(currentValueOut - previousValueOut); // Restar el valor anterior al valor actual
        var currentDate1 = new Date();
        labelsArray1.push(currentDate1.getHours() + ":" + currentDate1.getMinutes() + ":" + currentDate1.getSeconds());
      }
      previousValueOut = currentValueOut; // Actualizar el valor anterior
    });

    repetitions--;
    if (repetitions === 0) {
      clearInterval(intervalId);

      // Calcular la media de los valores de dataArray y dataArrayOut
      const mediaArray = dataArray.reduce((a, b) => a + b, 0) / dataArray.length;
      const mediaArrayOut = dataArrayOut.reduce((a, b) => a + b, 0) / dataArrayOut.length;

      // Crear gráfica
      const canvas = createCanvas(600, 400);
      const ctx = canvas.getContext('2d');
      const chart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: labelsArray,
          datasets: [{
            label: 'Paquetes entrantes',
            data: dataArray,
            borderColor: 'blue',
            borderWidth: 1
          }, {
            label: 'Media de paquetes entrantes',
            data: Array(dataArray.length).fill(mediaArray),
            borderColor: 'green',
            borderWidth: 1,
            borderDash: [10, 10]
          }]
        },
        options: {
          scales: {
            y: {
              ticks: {
                beginAtZero: true
              }
            }
          }
        }
      });

      // Crear gráfica
      const canvas1 = createCanvas(600, 400);
      const ctx1 = canvas1.getContext('2d');
      const chart2 = new Chart(ctx1, {
        type: 'line',
        data: {
          labels: labelsArray1,
          datasets: [{
            label: 'Paquetes salientes',
            data: dataArrayOut,
            borderColor: 'red',
            borderWidth: 1
          }, {
            label: 'Media de paquetes salientes',
            data: Array(dataArrayOut.length).fill(mediaArrayOut),
            borderColor: 'green',
            borderWidth: 1,
            borderDash: [10, 10]
          }]
        },
        options: {
          scales: {
            y: {
              ticks: {
                beginAtZero: true
              }
            }
          }
        }
      });
      // Obtener imagen de la gráfica como un buffer de PNG
      const buffer = canvas.toBuffer('image/png');
      // Obtener imagen de la gráfica como un buffer de PNG
      const buffer2 = canvas1.toBuffer('image/png');

      // Enviar imagen de la gráfica como un mensaje de foto en Telegram
      bot.sendPhoto(getChatId(), buffer);
      // Enviar imagen de la gráfica como un mensaje de foto en Telegram
      bot.sendPhoto(getChatId(), buffer2);

      // Eliminar la instancia de la gráfica para evitar fugas de memoria
      chart.destroy();
      // Eliminar la instancia de la gráfica para evitar fugas de memoria
      chart2.destroy();
    }
  }, 10000); // intervalo de 10 segundos
}
*/

//Comprobar que esté funcionando bien con las nuevas funciones creadas
function numOctetos() {
  console.log('funcion numOctetos');
  var msg = "Número de paquetes entrantes: ";
  var msg2 = "Número de paquetes salientes: ";
  var oid = ['1.3.6.1.2.1.2.2.1.11.45'];
  var oidOut = ['1.3.6.1.2.1.2.2.1.17.45'];
  var repetitions = 12; // 12 repeticiones de 10 segundos = 2 minutos
  var dataArray = [];
  var labelsArray = [];
  var labelsArray1 = [];
  var dataArrayOut = [];
  var previousValue = 0; // Variable para almacenar el valor anterior
  var previousValueOut = 0; // Variable para almacenar el valor anterior
  var oid1 = 0;
  var oid2 = 0;

  getOidNumOctetos(function(resultado) {

  var partes2 = resultado.split("|");
  oid1 = [partes2[0]];
  oid2 = [partes2[1]];
  
  console.log("Valor obtenido: " + oid1+ " y la oid 2: "+oid2);
  });

  var intervalId = setInterval(function() {

    getOid(oid1, function(data) {
      var currentValue = data;
      if (previousValue !== 0) {
        dataArray.push(currentValue - previousValue); // Restar el valor anterior al valor actual
        var currentDate = new Date();
        labelsArray.push(currentDate.getHours() + ":" + currentDate.getMinutes() + ":" + currentDate.getSeconds());
      }
      previousValue = currentValue; // Actualizar el valor anterior
    });

    getOid(oid2, function(dataOut) {
      var currentValueOut = dataOut;
      if (previousValueOut !== 0) {
        dataArrayOut.push(currentValueOut - previousValueOut); // Restar el valor anterior al valor actual
        var currentDate1 = new Date();
        labelsArray1.push(currentDate1.getHours() + ":" + currentDate1.getMinutes() + ":" + currentDate1.getSeconds());
      }
      previousValueOut = currentValueOut; // Actualizar el valor anterior
    });

    repetitions--;
    if (repetitions === 0) {
      clearInterval(intervalId);

      // Calcular la media de los valores de dataArray y dataArrayOut
      const mediaArray = dataArray.reduce((a, b) => a + b, 0) / dataArray.length;
      const mediaArrayOut = dataArrayOut.reduce((a, b) => a + b, 0) / dataArrayOut.length;

      // Crear gráfica
      const canvas = createCanvas(600, 400);
      const ctx = canvas.getContext('2d');
      const chart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: labelsArray,
          datasets: [{
            label: 'Paquetes entrantes',
            data: dataArray,
            borderColor: 'blue',
            borderWidth: 1
          }, {
            label: 'Media de paquetes entrantes',
            data: Array(dataArray.length).fill(mediaArray),
            borderColor: 'green',
            borderWidth: 1,
            borderDash: [10, 10]
          }]
        },
        options: {
          scales: {
            y: {
              ticks: {
                beginAtZero: true
              }
            }
          }
        }
      });

      // Crear gráfica
      const canvas1 = createCanvas(600, 400);
      const ctx1 = canvas1.getContext('2d');
      const chart2 = new Chart(ctx1, {
        type: 'line',
        data: {
          labels: labelsArray1,
          datasets: [{
            label: 'Paquetes salientes',
            data: dataArrayOut,
            borderColor: 'red',
            borderWidth: 1
          }, {
            label: 'Media de paquetes salientes',
            data: Array(dataArrayOut.length).fill(mediaArrayOut),
            borderColor: 'green',
            borderWidth: 1,
            borderDash: [10, 10]
          }]
        },
        options: {
          scales: {
            y: {
              ticks: {
                beginAtZero: true
              }
            }
          }
        }
      });
      // Obtener imagen de la gráfica como un buffer de PNG
      const buffer = canvas.toBuffer('image/png');
      // Obtener imagen de la gráfica como un buffer de PNG
      const buffer2 = canvas1.toBuffer('image/png');

      // Enviar imagen de la gráfica como un mensaje de foto en Telegram
      bot.sendPhoto(getChatId(), buffer);
      // Enviar imagen de la gráfica como un mensaje de foto en Telegram
      bot.sendPhoto(getChatId(), buffer2);

      // Eliminar la instancia de la gráfica para evitar fugas de memoria
      chart.destroy();
      // Eliminar la instancia de la gráfica para evitar fugas de memoria
      chart2.destroy();
    }
  }, 10000); // intervalo de 10 segundos

} 

/**
 * Get oid activo para numero de octetos entrantes y salientes
**/
function getOidNumOctetos(callback) {
  var oid1 = ['1.3.6.1.2.1.2.2.1.7']; // Estado de la interfaz
  var oid2 = ['1.3.6.1.2.1.2.2.1.8']; // Estado administrativo de la interfaz
  var oid3 = ['1.3.6.1.2.1.2.2.1.11']; // Número de octetos recibidos
  var oid4 = ['1.3.6.1.2.1.2.2.1.17']; // Número de octetos transmitidos

  var nonRepeaters = 0;
  var maxRepetitions = 20;
  var alreadyPrinted = false;

  // Consultar los valores de todas las interfaces en la tabla ifTable
  getBulkOid(oid1, nonRepeaters, maxRepetitions, function(status) {
    var partes = status.split("|");
    var valor = partes[1];
    if(valor == '1'){
      getBulkOid(oid2, nonRepeaters, maxRepetitions, function(adminStatus) {
        var partes1 = adminStatus.split("|");
        var valor1 = partes1[1];
        if(valor1 == '1'){
          getBulkOid(oid3, nonRepeaters, maxRepetitions, function(inOctets) {
            var partes2 = inOctets.split("|");
            var oid1 = partes2[0];
            var valor2 = partes2[1];
            if(valor2 != '0'){
              getBulkOid(oid4, nonRepeaters, maxRepetitions, function(outOctets) {
                var partes3 = outOctets.split("|");
                var oid2 = partes3[0];
                var valor3 = partes3[1];
                // Comprobar cada fila de la tabla ifTable
                if (valor3 != '0') {
                  // La interfaz está activa y se están recibiendo y transmitiendo datos
                  if (!alreadyPrinted) {
                    console.log('Oid de la interfaz activa paquetes entrantes: '+oid1 );
                    console.log('Oid de la interfaz activa paquetes salientes: '+oid2 );
                    callback(oid1 + "|" + oid2);
                    alreadyPrinted = true;
                  }
                }
              });
            }
          });
        }
      });
    }
  });
}

/**
* Execute an SNMP get
**/
function getOid(oid, callback) {
    if( !getSession() )
    {
        // send back the matched "whatever" to the chat
        bot.sendMessage(chatId, "No se ha establecido la conexión correctamente. Usa /session <direccion_ip> antes.");
    }
    else
    {
        getSession().get (oid, function (error, varbinds) {
            if (error) {
                console.error (error);
            } else {
                for (var i = 0; i < varbinds.length; i++)
                if (snmp.isVarbindError (varbinds[i])) {
                    console.error (snmp.varbindError (varbinds[i]));
                    bot.sendMessage(chatId, "ERROR:\n "+snmp.varbindError (varbinds[i]));
                } else {
                    console.log (varbinds[i]);
                    callback(varbinds[i].value);
                }
            }
        });
    }
}

/**
* Execute an SNMP getNext
**/
function getNextOid(oid, callback) {
    if( !getSession() )
    {
        // send back the matched "whatever" to the chat
        bot.sendMessage(chatId, "No se ha establecido la conexión correctamente. Usa /session <direccion_ip> antes.");
    }
    else
    {
        getSession().getNext (oid, function (error, varbinds) {
            if (error) {
                console.error (error);
            } else {

                for (var i = 0; i < varbinds.length; i++)
                if (snmp.isVarbindError (varbinds[i])) {
                    console.error (snmp.varbindError (varbinds[i]));
                    bot.sendMessage(chatId, "ERROR:\n "+snmp.varbindError (varbinds[i]));
                } else {
                    callback(varbinds[i].value);
                }
            }
        });
    }
}


/**
* Execute an SNMP getBulk
**/
/*
function getBulkOid(oid,nonRepeaters,maxRepetitions, callback) {
    if( !getSession() )
    {
        // send back the matched "whatever" to the chat
        bot.sendMessage(chatId, "No se ha establecido la conexión correctamente. Usa /session <direccion_ip> antes.");
    }
    else
    {
        
        
        getSession().getBulk (oid, nonRepeaters, maxRepetitions, function (error, varbinds) {
            if (error) {
                console.error (error);
            } else {

                 // step through the non-repeaters which are single varbinds
                for (var i = 0; i < nonRepeaters; i++) {
                if (i >= varbinds.length)
                   break;

                if (snmp.isVarbindError (varbinds[i])){
                    console.error (snmp.varbindError (varbinds[i]));
                }else{
                    callback(varbinds[i].value);
                    console.log (varbinds[i].oid + "|" + varbinds[i].value);
                    }
                } 

                // then step through the repeaters which are varbind arrays
                for (var i = nonRepeaters; i < varbinds.length; i++) {
                for (var j = 0; j < varbinds[i].length; j++) {
                    
                if (snmp.isVarbindError (varbinds[i][j]))
                    console.error (snmp.varbindError (varbinds[i][j]));
                else
                    console.log (varbinds[i][j].oid + "|" + varbinds[i][j].value);

                    callback(varbinds[i][j].value);
                    
                    
                }
                }
                

            }
        });
    }
}
*/
/**
* Execute an SNMP getBulk que devuelve oid y el valor
**/
function getBulkOid(oid,nonRepeaters,maxRepetitions, callback) {
  if( !getSession() )
  {
      // send back the matched "whatever" to the chat
      bot.sendMessage(chatId, "No se ha establecido la conexión correctamente. Usa /session <direccion_ip> antes.");
  }
  else
  {
      
      
      getSession().getBulk (oid, nonRepeaters, maxRepetitions, function (error, varbinds) {
          if (error) {
              console.error (error);
          } else {

               // step through the non-repeaters which are single varbinds
              for (var i = 0; i < nonRepeaters; i++) {
              if (i >= varbinds.length)
                 break;

              if (snmp.isVarbindError (varbinds[i])){
                  console.error (snmp.varbindError (varbinds[i]));
              }else{
                  callback(varbinds[i].value);
                  console.log (varbinds[i].oid + "|" + varbinds[i].value);
                  }
              } 

              // then step through the repeaters which are varbind arrays
              for (var i = nonRepeaters; i < varbinds.length; i++) {
              for (var j = 0; j < varbinds[i].length; j++) {
                  
              if (snmp.isVarbindError (varbinds[i][j]))
                  console.error (snmp.varbindError (varbinds[i][j]));
              else
                  //console.log (varbinds[i][j].oid + "|" + varbinds[i][j].value);

                  callback(varbinds[i][j].oid + "|" + varbinds[i][j].value);
                  
                  
              }
              }
              

          }
      });
  }
}

/**
* Execute an SNMP set
**/
function setOid(oid, valor, callback) {
    if( !getSession() )
    {
        // send back the matched "whatever" to the chat
        bot.sendMessage(chatId, "No se ha establecido la conexión correctamente. Usa /session <direccion_ip> antes.");
    }
    else
    {
        var varbinds = [
            {
                oid: oid,
                type: snmp.ObjectType.OctetString,
                value: valor
            }
        ];
        getSession().set (varbinds, function (error, varbinds) {
            if (error) {
                console.error (error);
            } else {
                for (var i = 0; i < varbinds.length; i++)
                if (snmp.isVarbindError (varbinds[i])) {
                    console.error (snmp.varbindError (varbinds[i]));
                    bot.sendMessage(chatId, "ERROR:\n "+snmp.varbindError (varbinds[i]));
                } else {
                    callback(varbinds[i].value);
                }
            }
        });
    }
}

/**
* Open a new SNMP session
**/
bot.onText(/\/scan/, function (msg, match) {
    setCommand('scan');
    setChatId(msg.chat.id);

    const ipRange = '192.168.0';
    const community = 'public';
    const port = 161;

    bot.sendMessage(chatId, "Se va a proceder al escaneo de dispositivos SNMP durante 5 segundos");

    scanDevices(ipRange, community, port)
    .then(devicesFound => {
        console.log('Dispositivos encontrados:', devicesFound);
        bot.sendMessage(chatId, 'Se encontraron los siguientes dispositivos:\n'+devicesFound.join('\n')).then(() => {
            const keyboard = {
                inline_keyboard: []
            };

            devicesFound.forEach(ip => {
                keyboard.inline_keyboard.push([
                    { text: ip, callback_data: 'session ' + ip }
                ]);
            });

            bot.sendMessage(chatId, 'Seleccione una dirección IP:', { reply_markup: keyboard });
        });
    })
    .catch(error => {
        console.error('Error al escanear dispositivos:', error);
    });
});

bot.on('callback_query', function (callbackQuery) {
    const data = callbackQuery.data.split(' ');
    const command = data[0];
    const ip = data[1];

    if (command === 'session') {
        commandSession(callbackQuery.message.chat.id, ip);
    }
});

/**
* Open a new SNMP session
**/
bot.onText(/\/session/, function (msg, match) {
    setCommand('session');
    setChatId(msg.chat.id);
    bot.sendMessage(msg.from.id, 'Introduzca la direccion IP del agente SNMP');
});

/**
* User enter Session
**/
var commandSession = function(chatId, ip) {
    setSession(snmp.createSession(ip, "public"));
    bot.sendMessage(chatId, "Hecho! Una nueva conexión SNMP abierta con la dirección "+ip);
    console.log('Hecho! Una nueva conexión SNMP abierta con la dirección %s', ip);
}

/**
 * Funcion para escanear dispositivos que dispongan de SNMP en la red
 */
function scanDevices(ipRange, community, port) {
    const devicesFound = [];
  
    // Recorre el rango de direcciones IP
    for (let i = 1; i <= 255; i++) {
        const x = Math.floor(i / 256);
        const y = i % 256;
        const ipAddress = '192.168.' + x + '.' + y;
        //const ipAddress = '10.100.' + x + '.' + y;
      //const ipAddress = ipRange + '.' + i;
  
      // Crea un objeto Session para la dirección IP actual
      const session = snmp.createSession(ipAddress, community, { port: port });
  
      // Realiza una consulta SNMP para la dirección IP actual
      session.get(['1.3.6.1.2.1.1.5.0'], function (error, varbinds) {
        /*if (error) {
          console.error(error);
          return;
        }*/
  
        // Si la consulta fue exitosa, agrega la dirección IP a la lista de dispositivos encontrados
        devicesFound.push(ipAddress);
      });
    }
  
    // Espera a que se completen todas las consultas antes de devolver la lista de dispositivos encontrados
    return new Promise(resolve => {
      setTimeout(() => {
        resolve(devicesFound);
      }, 5000);
    });
}

