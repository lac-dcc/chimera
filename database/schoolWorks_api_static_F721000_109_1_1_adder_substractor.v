module adder_substractor (a,b,select,out);
input [3:0]a;
input [3:0]b;
input select;
output [4:0]out;
reg [4:0]out;
always @(select or a or b)
begin 
	if (select)
	begin 
		out = a+b;
	end
	else
	begin 
		out = a-b;
	end
end
endmodule