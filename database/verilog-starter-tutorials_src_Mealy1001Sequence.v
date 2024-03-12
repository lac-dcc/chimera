module mealy_1001( clk, rst, inp, out);
    input clk, rst, inp;
    output out;
    reg[1:0] state;
    reg out;
    always @( posedge clk, posedge rst ) begin
    if( rst ) begin
        state <= 2'b00;
        out <= 0;
    end
    else
        begin
        case( state )
        2'b00: begin
            if( inp ) begin
                state <= 2'b01;
                out  <= 0;
            end
            else begin
                state <= 2'b00;
                out <= 0;
            end
        end

        2'b01: begin
            if( inp ) begin
                state <= 2'b01;
                out  <= 0;
            end
            else  begin
                state <= 2'b10;
                out <= 0;
            end

        end

        2'b10: begin
            if( inp ) begin
                state <= 2'b01;
                out  <= 0;
            end
            else begin
                state <= 2'b11;
                out <= 0;
            end

        end
       
        2'b11: begin
            if( inp ) begin
                state <= 2'b00;
                out  <= 1;
            end
            else begin
               state <= 2'b00;
               out <= 0;
            end

        end
       
        default: begin
            state <= 2'b00;
            out <= 0;
        end
        endcase
    end
end

endmodule


module fsm_testbench;

    reg  clk, rst, inp;
    wire out;
    wire [1:0]state;
    reg[15:0] sequence;
    integer i;

    mealy_1001 dut( clk, rst, inp, out);

    initial
    begin

    $dumpfile("vcd/Mealy1001Sequence.vcd");
    $dumpvars(0,fsm_testbench);
    $monitor("State = ", state, " Input = ", inp, ", Output = ", out);

    clk = 0;
    rst = 1;
    sequence = 16'b0101_0111_0111_1001;
    #5 rst = 0;

    for( i = 0; i <= 15; i = i + 1)
    begin
        inp = sequence[i];
        #2 clk = 1;
        #2 clk = 0;
    end
    
end

endmodule
