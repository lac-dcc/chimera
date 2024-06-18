// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module command_tb;
   reg rst;
   reg clk;
   reg cmd_done;
   reg init_comp;

   wire [3:0] cmd;
   wire       switch;
   wire [1:0] cmd_sent;
   
   command dut (
                .rst(rst),
                .clk(clk),
                .cmd_done(cmd_done),
                .init_comp(init_comp),
                .cmd(cmd),
                .switch(switch),
                .cmd_sent(cmd_sent)
                );
   
   always
     begin
        clk <= 'b1;
        #5;
        clk <= 'b0;
        #5;
     end

   initial
     begin
        $dumpvars;
        rst <= 'b0;
        init_comp <= 'b0;
        cmd_done <= 'b0;
        
        repeat (5)
          @ (posedge clk);

        rst <= 'b1;

        repeat (5)
          @ (posedge clk);
        
        init_comp <= 'b1;
        cmd_done  <= 'b0;
        repeat (1)
          @ (posedge clk);


        repeat (5)
          @ (posedge clk);
        cmd_done  <= 'b1;
        repeat (1)
          @ (posedge clk);
        cmd_done <= 'b0;

        repeat (7)
          @ (posedge clk);
        cmd_done  <= 'b1;
        repeat (1)
          @ (posedge clk);
        cmd_done <= 'b0;

        repeat (3)
          @ (posedge clk);
        cmd_done  <= 'b1;
        repeat (1)
          @ (posedge clk);
        cmd_done <= 'b0; 

        repeat (3)
          @ (posedge clk);
        cmd_done  <= 'b1;
        repeat (1)
          @ (posedge clk);
        cmd_done <= 'b0;

        repeat (3)
          @ (posedge clk);
        cmd_done  <= 'b1;
        repeat (1)
          @ (posedge clk);
        cmd_done <= 'b0;

        repeat (3)
          @ (posedge clk);
        cmd_done  <= 'b1;
        repeat (1)
          @ (posedge clk);
        cmd_done <= 'b0; 
        #500;

        
        $finish;
     end
endmodule
