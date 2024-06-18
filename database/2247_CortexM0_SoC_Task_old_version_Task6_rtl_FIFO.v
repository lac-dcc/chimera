// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

//it is just a normal FIFO
module FIFO(
    input clock,
    input sclr,

    input rdreq, wrreq,
    output reg full, empty,

    input [7 : 0] data,
    output [7 : 0] q

);

reg [7 : 0] mem [15 : 0];
reg [3 : 0] wp, rp;
reg w_flag, r_flag;

initial
begin
wp=0;
w_flag=0;
rp=0;
r_flag=0;
end


always @(posedge clock) begin
    if (~sclr) begin
        wp <= 0;
        w_flag <= 0;
    end else if(!full && wrreq) begin 
        wp<= (wp==16-1) ? 0 : wp+1;
        w_flag <= (wp==16-1) ? ~w_flag : w_flag;
    end
end

always @(posedge clock) begin
    if(wrreq && !full)begin
        mem[wp] <= data;
    end
end

always @(posedge clock) begin
    if (~sclr) begin
        rp<=0;
        r_flag <= 0;
    end else if(!empty && rdreq) begin 
        rp<= (rp==16-1) ? 0 : rp+1;
        r_flag <= (rp==16-1) ? ~r_flag : r_flag;
    end
end

assign q = mem[rp];

always @(*) begin
    if(wp==rp)begin
        if(r_flag==w_flag)begin
            full <= 0;
            empty <= 1;
        end else begin
            full <= 1;
            empty <= 0;
        end
    end else begin
        full <= 0;
        empty <= 0;
    end
end



endmodule