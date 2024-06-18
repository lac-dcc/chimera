// This program was cloned from: https://github.com/aconantguy/BMP-Tools
// License: GNU Lesser General Public License v2.1

module imageColorize();
  integer infile, outfile1, outfile2, outfile3, width, height, padding, a, i, j;
  reg [7:0] fileHeader [13:0];
  reg [7:0] infoHeader [39:0];
  reg [8:0] red, green, blue, gray;
  
  initial begin
    
    // Open files
    infile = $fopen("in.bmp", "rb");
    outfile1 = $fopen("yellow.bmp", "wb");
    outfile2 = $fopen("purple.bmp", "wb");
    outfile3 = $fopen("turquoise.bmp", "wb");
    
    // Copy headers
    for(i = 0; i < 14; i = i + 1) begin
    a = $fscanf(infile, "%c", fileHeader[i]);
    $fwrite(outfile1, "%c", fileHeader[i]);
    $fwrite(outfile2, "%c", fileHeader[i]);
    $fwrite(outfile3, "%c", fileHeader[i]);
    end
    
    for(i = 0; i < 40; i = i + 1) begin
    a = $fscanf(infile, "%c", infoHeader[i]);
    $fwrite(outfile1, "%c", infoHeader[i]);
    $fwrite(outfile2, "%c", infoHeader[i]);
    $fwrite(outfile3, "%c", infoHeader[i]);
    end
    
    // Find Width and Height
    width = {infoHeader[7], infoHeader[6], infoHeader[5], infoHeader[4]};
    height = {infoHeader[11], infoHeader[10], infoHeader[9], infoHeader[8]};
    
    padding = (4 - (width * 3) % 4) % 4;
    
    // Copy Pixels
    for(j = 0; j < height; j = j + 1) begin
  
      for (i = 0; i < width; i = i + 1) begin
        // Read Pixels
        a = $fscanf(infile, "%c%c%c", red, green, blue);

        // Write Colorized Pixels
        $fwrite(outfile1, "%c%c%c", 0, green, blue);
        $fwrite(outfile2, "%c%c%c", red, 0, blue);
        $fwrite(outfile3, "%c%c%c", red, green, 0);
      end 
    
    // Apply Padding
      for(i = 0; i < padding; i = i + 1) begin
        $fscanf(infile, "%c", a);
        $fwrite(outfile1, "0");
        $fwrite(outfile2, "0");
        $fwrite(outfile3, "0");
      end 

    end
    
    // Close files
    $fclose(infile);
    $fclose(outfile1);
    $fclose(outfile2);
    $fclose(outfile3);
  end
endmodule
    