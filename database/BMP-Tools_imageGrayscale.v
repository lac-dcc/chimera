// This program was cloned from: https://github.com/aconantguy/BMP-Tools
// License: GNU Lesser General Public License v2.1

module imageGrayscale();
  integer infile, outfile, width, height, padding, a, i, j;
  reg [7:0] fileHeader [13:0];
  reg [7:0] infoHeader [39:0];
  reg [8:0] red, green, blue, gray;
  
  initial begin
    
    // Open files
    infile = $fopen("in.bmp", "rb");
    outfile = $fopen("grayscale.bmp", "wb");
    
    // Copy headers
    for(i = 0; i < 14; i = i + 1) begin
    a = $fscanf(infile, "%c", fileHeader[i]);
    $fwrite(outfile, "%c", fileHeader[i]);
    end
    
    for(i = 0; i < 40; i = i + 1) begin
    a = $fscanf(infile, "%c", infoHeader[i]);
    $fwrite(outfile, "%c", infoHeader[i]);
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

        // Calculate gray value
        gray = (red+green+blue) / 3;
    
        // Flip Pixels within the row
        $fwrite(outfile, "%c%c%c", gray, gray, gray);
      end 
    
    // Apply Padding
      for(i = 0; i < padding; i = i + 1) begin
        $fscanf(infile, "%c", a);
        $fwrite(outfile, "0");
      end 

    end
    
    // Close files
    $fclose(infile);
    $fclose(outfile);
    
  end
endmodule
    