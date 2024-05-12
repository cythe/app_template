#include <stdio.h>
#include <stdlib.h>
#include "sub.h"
#include "mymath.h"
#include "othermath.h"
#include "macro.h"

#include <jpeglib.h>

// 调用jpeg获取图片分辨率
void read_jpeg_header(const char *filename) {
    struct jpeg_decompress_struct cinfo;
    struct jpeg_error_mgr jerr;
    FILE *infile;

    if((infile = fopen(filename, "rb")) == NULL) {
        fprintf(stderr, "can't open %s\n", filename);
        exit(1);
    }

    cinfo.err = jpeg_std_error(&jerr);
    jpeg_create_decompress(&cinfo);
    jpeg_stdio_src(&cinfo, infile);
    jpeg_read_header(&cinfo, TRUE);

    printf("Image resolution: %d x %d\n", cinfo.image_width, cinfo.image_height);

    jpeg_destroy_decompress(&cinfo);
    fclose(infile);
}

int main(int argc, char *argv[])
{
     if (argc != 2) {
        fprintf(stderr, "Usage: %s <jpeg-file>\n", argv[0]);
        return 1;
    }

    printf("int: 3+5=%d\n", (int)add(3, 5));
    printf("float: 3+5=%f\n", (float)add(3.0f, 5.0f));
    printf("int: 3*5=%d\n", (int)mul(3, 5));
    printf("int: 3-5=%d\n", (int)sub(3, 5));

    printf("TEST_VAR =%d\n", TEST_VAR);

    read_jpeg_header(argv[1]);

    return 0;
}
