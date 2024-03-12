module moore_ooo(clk,rst,inp,out);

    input clk, rst, inp;
    output out;

    reg[1:0] state;
    reg out;

    always @(posedge clk, posedge rst)

    begin
    if(rst)
    begin
        state <= 2'b00;
    end
    else
        begin
            case(state)
            2'b00:
                begin
                    if(inp)
                        state <= 2'b00;
                    else
                        state <= 2'b01;
                end
            2'b01:
                begin
                    if(inp)
                        state <= 2'b00;
                else
                        state <= 2'b10;
                end
            2'b10:
                begin
                    if(inp)
                        state <= 2'b00;
                    else
                        state <= 2'b11;
                end
            2'b11:
                begin
                    if(inp)
                        state <= 2'b00;
                    else
                        state <= 2'b01;
                end
            endcase
    end
    end

    always @( posedge clk, 	posedge rst)
    begin
        if(rst)
            out <= 0;
        else if(state == 2'b11)
            out <= 1;
        else
            out <= 0;
    end
endmodule
		


module fsm_testbench;

    reg  clk, rst, inp;
    wire out;
    wire[1:0] state;
    reg[15:0] sequence;
    integer i;

    moore_ooo dut( clk, rst, inp, out);

    initial
    begin
    $dumpfile("vcd/Moore000Sequence.vcd");
    $dumpvars(0,fsm_testbench);
    $monitor("State = ", state, " Input = ", inp, ", Output = ", out);

       clk = 0;
        rst = 1;
        sequence = 16'b0101_0111_0111_1000;
        #5 rst = 0;

        for( i = 0; i <= 15; i = i + 1)
        begin
            inp = sequence[i];
            #2 clk = 1;
            #2 clk = 0;
        end
    
    end
endmodule
