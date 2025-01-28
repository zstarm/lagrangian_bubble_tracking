FC := gfortran
OBJS =  lgbubble.o dblyLinkedList_lgBubble.o main.o

BUILD_FILES_DIR := build_files
OUT := out

.PHONY: clean cleanall $(BUILD_FILES_DIR) 

all : $(OUT).exe $(BUILD_FILES_DIR)
	mv *.o *.mod $(BUILD_FILES_DIR)/.

$(BUILD_FILES_DIR) :
	mkdir -p $(BUILD_FILES_DIR)

$(OBJS): %.o: %.F90
	$(FC) -c $^ -o $@

$(OUT).exe : $(OBJS)
	$(FC) -o $(OUT).exe $(OBJS)

cleanall :
	rm -rf $(BUILD_FILES_DIR)
	rm -rf *.exe

clean :
	rm -rf *.exe

