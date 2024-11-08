#include <stdio.h>
  #include <unistd.h>

#include <sys/stat.h>		/* struct stat y fstat */
#include <sys/mman.h>		/* mmap */
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include <function.h>


int main(int argc, char **argv)

  
{

  struct estadisticas lectura;
  printf("Se van a leer estadisticas: \n");
  
  lectura = leer(argv[1]);

  printf ("Tipo: %s\n", lectura.tipo);
      printf ("Agua: %s\n", lectura.agua);
        printf ("Luz: %s\n", lectura.luz);
      printf ("Abono: %s\n", lectura.abono);
      printf ("Vida: %s\n", lectura.vida);
      printf ("Enfermedad: %s\n", lectura.enfermedad);
      printf ("Longevidad: %s\n", lectura.longevidad);


      printf("Se van a escribir estadisticas: \n");

      escribir(argv[2],lectura);
  return 0;
}

  
