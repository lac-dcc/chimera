module adder(
    D,A,add_out,c_out
    );
    parameter m=8,n=8;
    input [m-1:0] D,A;
    output [m-1:0] add_out;
    output c_out;
    wire [m:0] add_result, data1, data2;
    assign data1 = {1'b0,D};
    assign data2 = {1'b0,A};
    assign add_result = data1+data2;
    assign add_out = add_result[m-1:0];
    assign c_out = add_result[m];
endmodule

module controller(clk,rst,lsb,load_cmd,add_cmd,shift_cmd,out_cmd);
    input clk, rst,lsb;
    output load_cmd,add_cmd,shift_cmd,out_cmd;
    reg load_cmd,add_cmd,shift_cmd, out_cmd;
    reg [2:0] state;
    reg start;
    integer count;
    parameter m=8;
    parameter n=8;
    parameter idle=3'b000, init=3'b001, test=3'b010, add=3'b011, shift=3'b100;
    always@(posedge clk or posedge rst)
        if (rst)
            begin
                state<=idle;
                count<=0;
                start<=1;
                out_cmd<=0;
            end
        else 
            case (state)
                idle: begin
                    load_cmd<=0;
                    add_cmd<=0;
                    shift_cmd<=0;
                    if (start) begin
                        state<=init;
                        out_cmd<=0;
                    end
                    else begin
                        state<=idle;
                        out_cmd<=1;
                    end
                end
                init: begin
                    load_cmd<=1;
                    add_cmd<=0;
                    shift_cmd<=0;
                    out_cmd<=0;
                    state<=test;
                end
                test: begin
                    load_cmd<=0;
                    add_cmd<=0;
                    shift_cmd<=0;
                    out_cmd<=0;
                    if (lsb) begin
                        state<=add;
                        end
                    else state<=shift;
                end 
                add: begin
                    load_cmd<=0;
                    add_cmd<=1;
                    shift_cmd<=0;
                    out_cmd<=0;
                    state<=shift;
                end
                shift: begin
                    load_cmd<=0;
                    add_cmd<=0;
                    shift_cmd<=1;
                    out_cmd<=0;
                    if (count<m) begin
                        state<=test;
                        count<=count+1;
                    end
                    else begin
                        count<=0;
                        state<=idle;
                        start<=0;
                    end
                end 
            endcase                
endmodule

module shifter(
    add_out,c_out,load_cmd,add_cmd,shift_cmd,clk,rst,out_cmd,Q,A,lsb,out   
 );
 parameter m=8,n=8;
 input [m-1:0] add_out;
 input c_out,load_cmd,add_cmd,shift_cmd,clk,rst,out_cmd;
 input [n-1:0] Q;
 output [m-1:0] A;
 output lsb;
 output reg [m+n-1:0] out; 
 reg [m+n:0] temp;
 reg add_temp;
 
 assign A = temp[m+n-1:n];
 assign lsb = temp[0];
 always@(posedge clk or posedge rst)
 begin
    if (rst)
    begin
        add_temp<=0;
        temp<=0;
    end
    else
    begin
        if (load_cmd)
        begin
            temp[m+n:n]<=0;
            temp[n-1:0]<=Q;
        end
        else if (add_cmd)
            add_temp<=1;
        else if (shift_cmd && add_temp)
        begin
            temp<={1'b0, c_out, add_out, temp[n-1:1]};
            add_temp<=0;
        end
        else if (shift_cmd && !add_temp)
            temp<={1'b0, temp[m+n:1]}; 
    end
 end
 always@(out_cmd)
 begin
    if (!out_cmd)
        out<=0;
    else
        out<=temp[m+n-1:0];
 end
 endmodule

module multiplier(clk, rst, D, Q, out);
parameter m=8, n=8;
input clk, rst;
input [m-1:0] D;
input [n-1:0] Q;
output [m+n-1:0] out;

wire c_out,load_cmd,add_cmd,shift_cmd,lsb,out_cmd;
wire [m-1:0] A,add_out;
adder adder(.D(D), .A(A), .add_out(add_out), .c_out(c_out));
shifter shifter(add_out,c_out,load_cmd,add_cmd,shift_cmd,clk,rst,out_cmd,Q,A,lsb,out);
controller controller(clk,rst,lsb,load_cmd,add_cmd,shift_cmd,out_cmd);
endmodule

module multiplier_tb;
parameter m=8, n=8;
reg clk, rst;
reg [m-1:0] D;
reg [n-1:0] Q;
wire [m+n-1:0] out;

multiplier multiplier(clk, rst, D, Q, out);

initial 
begin
    clk = 1'b1;
    forever #5 clk = ~clk;
end
initial
begin

    rst = 1;
    #20;
    rst = 0;
    D = 8'b11111111;
    Q = 8'b11111111;
    #2000;
    rst = 1;
    #20;
    rst = 0;
    D = 8'b00011111;
    Q = 8'b00011111;
    #2000;
    rst = 1;
    #20;
    rst = 0;
    D = 8'b00000001;
    Q = 8'b00000001;
    #2000;
end
endmodule
