OBJECTS1 = taylor_main.o  exptaylor.o
.PHONY: clean1

exp_output.txt: taylor_main.exe
	./taylor_main.exe > exp_output.txt

taylor_main.exe: $(OBJECTS1)
	gfortran $(OBJECTS1) -o taylor_main.exe

%.o : %.f90
	gfortran -c $< 

clean1:
	rm -f $(OBJECTS1) taylor_main.exe


OBJECTS2 = taylor_main2.o  sinetaylor.o
.PHONY: clean2

sine_output.txt: taylor_main2.exe
	./taylor_main2.exe > sine_output.txt

taylor_main2.exe: $(OBJECTS2)
	gfortran $(OBJECTS2) -o taylor_main2.exe

%.o : %.f90
	gfortran -c $< 
clean2:
	rm -f $(OBJECTS2) taylor_main2.exe