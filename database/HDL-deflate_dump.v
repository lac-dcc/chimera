module init();
initial begin
	$dumpfile("test.vcd");
	$dumpvars(0, test_fast_bench);
end
endmodule
