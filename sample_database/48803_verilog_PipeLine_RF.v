// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module RF(
    ra,
    rb,
    rd,
    rw,
    we,
    qa,
    qb,
    clk,
    reset

);
input wire clk,we;
input wire [4:0] ra,rb,rw;
input wire [31:0] rd;
input wire reset;
output [31:0] qa,qb;
reg [31:0] Rheap[31:0];



// assign qa = (ra==0)?0:Rheap[ra];
// assign qb = (rb==0)?0:Rheap[rb];

assign qa = (ra==0)?0:((we&&rw==ra)?rd:Rheap[ra]);
assign qb = (rb==0)?0:((we&&rw==rb)?rd:Rheap[rb]);

always @(negedge clk)
	if ((rw != 0) && we)
		Rheap[rw] = rd;

integer i;
always @(reset)
begin
    if(reset)
    begin
        for(i=0;i<32;i=i+1)
        begin
            Rheap[i] = 0;
        end
    end
end


endmodule


