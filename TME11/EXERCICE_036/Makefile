CC=gnatmake
EXEC=philo

all: $(EXEC)

$(EXEC): $(EXEC).adb
	$(CC) $<

.PHONY: all proper clean

proper:
	rm -f *~

clean: proper
	rm -f *.o *.ali $(EXEC)
