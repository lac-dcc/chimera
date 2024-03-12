// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

`timescale 1ns / 10 ps 
`define EOF 32'hFFFF_FFFF 
`define NULL 0 
`define MAX_LINE_LENGTH 1000 
  
module read_pattern; 
integer fControl, c, r, txLength, tDelta; 
reg [3:0] bin; 
reg [31:0] dec, hex; 
real real_time; 
reg [8*`MAX_LINE_LENGTH:0] line; /* Line of text read from file */ 

string str = "";

initial 
    begin : file_block 
    $timeformat(-9, 0, "ns", 6); 

`ifndef verilator
    fControl = $fopenr("/tmp/fifo"); 
`endif
    if (fControl == `NULL) // If error opening file 
        disable file_block; // Just quit 

    while (fControl != `NULL)  
    begin
      c = $fgetc(fControl); 
      while (c != `EOF) 
      begin 
          /* Check the first character for comment */ 
          if (c == "/") // just skip
          begin 
            line="";
            r = $fgets(line, fControl); 
            str = line; // string type removes trailing empty space
            $display("[%6t] ", $time, "/%s", str);
          end

          if (c == "r") // pass string back to simulatiom
          begin
            line="";
            r = $fgets(line, fControl); 
            str = line; // string type removes trailing empty space
            $display("[%6t] ", $time, "RX: '%s'", str);
          end
          
          if (c == "t") // wait for simulation to transmit N chars
          begin
            txLength=0;
            r = $fscanf(fControl,"%d\n", txLength); 
            $display("[%6t] ", $time, "TX: waiting for %1d chars", txLength);
          end
          
          if (c == "#") // skil N ns
          begin
            tDelta=0;
            r = $fscanf(fControl,"%d\n", tDelta); 
            $display("[%6t] ", $time, "#%1d begin", tDelta);
            #tDelta $display("[%6t] ", $time, "#%1d end", tDelta);
          end

          if (c == "q") // quit
          begin
            disable file_block; // Just quit 
          end

            // // Push the character back to the file then read the next time 
            // r = $ungetc(c, fControl); 
            // r = $fscanf(fControl," %f:\n", real_time); 
            // $display("got time '%f' ", real_time);

            // // Wait until the absolute time in the file, then read stimulus 
            // if ($realtime > real_time) 
            //     $display("Error - absolute time in file is out of order - %t", real_time); 
            // else 
            //     #(real_time - $realtime) r = $fscanf(fControl," %b %d %h\n",bin,dec,hex); 
            // end // if c else 

          c = $fgetc(fControl); // -1 == eof
      end // while not EOF 
    
      $fclose(fControl); 
            
`ifndef verilator
      fControl = $fopenr("/tmp/fifo"); 
`endif
      if (fControl == `NULL) // If error opening file 
          disable file_block; // Just quit 

    end // restart read
  end // initial


// Display changes to the signals 
always @(bin or dec or hex) 
    $display("%t %b %d %h", $realtime, bin, dec, hex); 
  
endmodule // read_pattern
