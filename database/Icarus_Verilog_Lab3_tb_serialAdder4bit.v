`include "serialAdder_4bit.v"       //Acc, SI, ShftCtrl, clr, clk
module tb_serialAdder4bit();
    
    wire [3:0] Acc;
    wire SI2;
    reg SI;
    reg clr, clk, ShftCtrl;
    integer i;


    serialAdder_4bit sa( Acc,SI2, SI, ShftCtrl, clr, clk );

    always @(posedge clk)   begin
        $display("ShftCtrl = %b ", ShftCtrl, " SI = %b ", SI," SI2:= ",SI2 ," Acc = %b ", Acc, "Clk: = ",clk," dff_out = %b ", sa.dff.q, "time = ", $time);
    end

    reg [19:0] sequence;

    initial begin
        
        ShftCtrl = 1;
        clk = 1'b0;
        clr = 1'b0;
        #2 clr = 1'b1;
        sequence = 20'b0100_0011_0010_0001_0000;

        for(i=0; i<24; i= i+1) begin
                if( i<20 )
                    SI = sequence[i];
            #2  clk = 1'b1;
            #2  clk = 1'b0;
        end

    end

endmodule