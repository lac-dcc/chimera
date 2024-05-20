// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module FpAdd_tb;
   reg [26:0] tst_in1;
   reg [26:0] tst_in2;
   reg        tst_clk;
   reg        tst_rst;
   wire [26:0] tst_out;
   reg [31:0]  fh;
   reg [31:0]  oh;
   reg [31:0]  file_result;
   integer     count;
   integer     total;
   
   reg [26:0]  vec1 [1023:0];
   reg [26:0]  vec2 [1023:0];
   
   initial
     begin
        fh = $fopen("../test/Fp_Add_tstvec.txt","r");
        //oh = $fopen("../run/FpAddtemp.txt","w");
     end

   
   FpAdd dut (
              .clk(tst_clk),
              .rst(tst_rst),
              .in1(tst_in1),
              .in2(tst_in2),
              .sum(tst_out)
              );
   
   always
     begin
        tst_clk <= 1'b1;
        #5;
        tst_clk <= 1'b0;
        #5;
     end
   
   always @(posedge tst_clk)
     begin
        if (tst_rst == 'b1)
          begin
             tst_in1 <= vec1[count];
             tst_in2 <= vec2[count];
             $display("%b",tst_out);
             count <= count + 1;
             if (count == total)
               begin
                  $finish;
               end
          end
     end
   


   
   initial
     begin
        $dumpvars;
        count = 0;
        while (!$feof(fh))
          begin
             file_result = $fscanf(fh,"%b %b",vec1[count],vec2[count]);
             count = count + 1;
          end
        total <= count;
        count <= 0;
        tst_rst = 'b0;
        repeat (5)
          begin
             @ (posedge tst_clk);
          end
        //#50;
        tst_rst <= 'b1;
        
        #200000;
        $finish;
        
        
     end

endmodule
