FC = gfortran

BUILD_FILES_DIR = build_files
OBJS = linkedList_lgBubble.o lgbubble.F90 main.o
OUT = out

.PHONY: clean $(BUILD_FILES_DIR) 

all : $(OUT).exe $(BUILD_FILES_DIR)
	mv *.o *.mod $(BUILD_FILES_DIR)/.

$(BUILD_FILES_DIR) :
	mkdir -p $(BUILD_FILES_DIR)

lgbubble.o : lgbubble.F90
	$(FC) -c -o $@ $<

linkedList_lgBubble.o : lgbubble.o linkedList_lgBubble.F90
	$(FC) -c -o $@ $^

main.o : linkedList_lgBubble.o main.F90
	$(FC) -c -o $@ $^

$(OUT).exe : $(OBJS)
	$(FC) -o $(OUT).exe $(OBJS)

cleanall :
	rm -rf $(BUILD_FILES_DIR)
	rm -rf $(TARGET).exe

clean :
	rm -rf build.exe

