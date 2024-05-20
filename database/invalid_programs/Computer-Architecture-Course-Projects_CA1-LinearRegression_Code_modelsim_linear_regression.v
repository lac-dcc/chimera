// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License



module linear_reggression(clk,inx,iny,start,rst);
	input [19:0] iny,iny;
	input clk,start,rst;
	wire [19:0] outx,outy,b0,b1;
	wire cout,coef_read,coef_done,error_checker_ready,en_coef,en_err,finishd,con_state;
	data_ld(.clk(clk),.inx(inx),.iny(iny),.outx(outx),.outy(outy),.cout(cout),.start(start),.coef_done(coef_ready),
			.coef_finish(coeff_done),.err_done(error_checker_ready),.en_coef(en_coef),.en_err(en_err),
			.finishd(finishd),.con_state(con_state));

	CoefficientCalcDriver (.x_bus(outx),.y_bus(outy),.en(en_coef),.cout(cout),.clk(clk),.rst(rst),.coeff_done(coef_done),
			.coeff_ready(coeff_ready),.b1(b1),.b0(b0));
	ErrorCheckerDriver(x_bus,y_bus,b1_bus,b0_bus,en,clk,rst,
			error_bus,.error_checker_ready(error_checker_ready),error_checker_done);



endmodule
