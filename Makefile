# Compile & Link Parameters
CC = gcc

# Path of dummy .so file: Use your dummy .so file path that specified on install step.
# (more details: [https://developers.curvsurf.com] Documentation > Installation)
DUMMY_PATH = ./lib_import/x86_64

ADDITIONAL_INCLUDE_PATH = 
ADDITIONAL_LIB_PATH = -L$(DUMMY_PATH)

CFLAGS = -Wno-implicit-function-declaration $(ADDITIONAL_INCLUDE_PATH)
LIBS = $(ADDITIONAL_LIB_PATH) -lm -lFindSurface

# Output Parameters
TARGET = BasicFindSurface
OBJDIR = obj

# SOURCE FILES
VPATH = src
SOURCES = main.c xyz_reader.c

OBJS = $(patsubst %.c, $(OBJDIR)/%.o, $(SOURCES))

# Define make rules
all: $(OBJDIR) $(TARGET)

$(OBJDIR):
	@mkdir -p $@

$(OBJDIR)/%.o: %.c
	@$(CC) -c -o $@ $< $(CFLAGS)

$(TARGET): $(OBJS)
	@$(CC) -o $@ $^ $(LIBS)

clean:
	@rm -rf $(OBJDIR)/*.o $(TARGET)
