module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    
    reg [2:0] ena_hms;	//determine when will "ss","mm" and "hh" need to be increased
    assign ena_hms = {(ena && (mm == 8'h59) && (ss == 8'h59)), (ena && (ss == 8'h59)), ena};   
    
    count60 count_ss(
        .clk(clk),
        .reset(reset),
        .ena(ena_hms[0]),
        .q(ss)
    );
    count60 count_mm(
        .clk(clk),
        .reset(reset),
        .ena(ena_hms[1]),
        .q(mm)
    );
    
    always @(posedge clk) begin
        if(reset) begin
        	hh <= 8'h12;    //hh=12
            pm <= 0;
        end
        else begin
            if(ena_hms[2]) begin    //if mm=59 and ss=59
                if(hh == 8'h12)  hh <= 8'h1; //hh will change:12AM->1AM or 12PM->1PM  
                else if(hh == 8'h11) begin  //if hh=11, then PM->AM or AM->PM
            		hh[3:0] <= hh[3:0] + 1'h1; //hh=12
               		pm <= ~pm;
                end 
                else begin
                    if(hh[3:0] == 4'h9) begin
                        hh[3:0] <= 4'h0;
                        hh[7:4] <= hh[7:4] + 1'h1;
                    end
                    else hh[3:0] = hh[3:0] + 1'h1;
                end
            end
            else hh <= hh;
        end
    end

endmodule

module count60(
	input clk,
    input reset,
    input ena,
    output [7:0] q
);
    always @(posedge clk) begin
        if(reset) q <= 8'h0;
        else begin
            if(ena) begin 
                if(q[3:0] == 4'h9) begin
                    if(q[7:4] == 4'h5) q <= 8'h0;
                    else begin
                        q[7:4] <= q[7:4] + 1'h1;
                        q[3:0] <= 4'h0;
                    end 
                end
                else q[3:0] <= q[3:0] + 1'h1; 
            end
            else q <= q;
        end
    end
endmodule
