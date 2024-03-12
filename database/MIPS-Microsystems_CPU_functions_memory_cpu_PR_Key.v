module Key(clk,reset,key,IRQ,Key_RD);
//input
    input clk;
    input reset;

    input [7:0] key;
    
//output
    output reg IRQ;
    output [31:0] Key_RD;

//sequential logic
    reg [7:0] data;

    assign Key_RD={24'b0,data};

    always @(posedge clk)
        begin
            if(reset)
                begin
                    data<=0;
                    IRQ<=0;
                end 
            else if(data!=~key)
                begin
                    data<=~key;
                    IRQ<=1;
                end
            else
                begin
                    data<=data;
                    IRQ<=0;
                end
        end

endmodule