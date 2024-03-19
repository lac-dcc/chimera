module mux16to1(
    output [8:0] outp,
    input [3:0] x
);

    assign outp = 25*x;

endmodule

module adder_reg(
    output [12:0] y,
    input acc_rst1,
    input acc_rst2,
    input clock,
    input [8:0] muxVal
);

    reg [12:0] acc;
    initial 
        acc = 13'b0;
    always @(posedge clock) begin
        // $display("acc_rst2:= ",acc_rst2);
        if(acc_rst1 == 1)
            acc = acc + {4'b0,muxVal};
        else
            acc = acc;
    end

    always @(posedge acc_rst2 or negedge acc_rst2)
        acc = 13'b0;
    
    assign y = acc;

endmodule

module dff(
    output reg q,
    output reg qbar,
    input d,
    input clock,
    input reset
);

    always @(posedge clock or reset) begin
        $display("q:=",q);
        if(reset == 1) begin
            q = 0;
            qbar = 1;
        end
        else begin
            q = d;
            qbar = ~q;
        end

    end

endmodule

module acc_rst(
    output acc_rst1,
    output acc_rst2,
    input clock,
    input reset
);

    wire [3:0] qout;
    wire [3:0] qbarout;

    dff ff1(.q(qout[0]),.qbar(qbarout[0]), .d(qbarout[0]), .clock(clock)  , .reset(reset));
    dff ff2(.q(qout[1]),.qbar(qbarout[1]), .d(qbarout[1]), .clock(qout[0]), .reset(reset));
    dff ff3(.q(qout[2]),.qbar(qbarout[2]), .d(qbarout[2]), .clock(qout[1]), .reset(reset));
    dff ff4(.q(qout[3]),.qbar(qbarout[3]), .d(qbarout[3]), .clock(qout[2]), .reset(reset));

    assign acc_rst1 = qout[2];
    assign acc_rst2 = qout[3];

    always @(posedge clock) begin
        $display("q := ",{qout[3],qout[2],qout[1],qout[0]});
    end

endmodule

module intg(
    output [12:0] y,
    input reset,
    input [3:0] x,
    input clock
);

    wire accRst1, accRst2;
    acc_rst accRst(.clock(clock),.reset(reset),.acc_rst1(accRst1), .acc_rst2(accRst2));
    wire [8:0] muxVal;
    mux16to1 mux(.x(x), .outp(muxVal));
    adder_reg adderReg(.clock(clock), .acc_rst1(accRst1), .acc_rst2(accRst2), .muxVal(muxVal), .y(y));

endmodule

module tb_intg();
    
    reg reset,clock;
    reg [3:0] x;
    wire [12:0] y;

    initial begin
            clock = 1'b0;
            reset = 1'b1;
            x = 4'd0;
        #16  reset = 1'b0;
        #8  x = 4'd10;
        #16 x = 4'd5;
        #16 x = 4'd12;
        #16 x = 4'd1;

        #16 x = 4'd13;
        #16 x = 4'd7;
        #16 x = 4'd9;
        #16 x = 4'd2;

        #16 x = 4'd11;
        #16 x = 4'd5;
        #16 x = 4'd4;
        #16 x = 4'd2;
        #200 $finish;
    end
    always
        #8 clock = ~clock;
    initial begin
        $dumpfile("file.vcd");
        $dumpvars;
    end

    intg circuit(.y(y), .reset(reset), .clock(clock), .x(x));
endmodule