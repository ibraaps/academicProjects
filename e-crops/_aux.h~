#include <stdio.h>
 #include <unistd.h>
#include <pthread.h>
#include <sys/stat.h>		/* struct stat y fstat */
#include <sys/mman.h>		/* mmap */
#include <sys/types.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include <stdbool.h>
#include <sys/times.h>
#include <sys/wait.h>
#include <sys/msg.h>
#include <dirent.h>
#include <math.h>


#define MAX_THREADS 5
#define DURACION_DIA 5

#define ROMERO 10
#define TULIPAN 20
#define TOMATES 30

#define NO_MAS 40
#define SI_MAS 45

#define ERROR_INPUT 50

#define VIDA_MAX 99
#define VIDA_MIN 00

#define MAX_AGUA 99
#define MIN_AGUA 00

#define MAX_ABONO 99
#define MIN_ABONO 00

#define MAX_LUZ 99
#define MIN_LUZ 00

#define SANA S
#define ENFERMA E

#define BAJA_STAT 49

#define PIERDE_VIDA -10


typedef struct {
    char tipo_planta;
    int num;
} ThreadData;

struct estadisticas{
  char tipo[10];
  int agua;
  int luz;
  int abono;
  int vida;
  char enfermedad[10];
  int longevidad;
  };

volatile struct estadisticas planta_array[5];

struct estadisticas leer(int num);
int cuentafich();
void escribir (int num, struct estadisticas stat);

void *planta(void *arg);
int elegir_opcion(char *input);
int elegir_planta(char *input);
int comprobar_continuacion(char *input);
void creaFICH(int name, char *tipo);
void imprimearte(int tipo, int dia);
void borrar_all_fich(int num);
