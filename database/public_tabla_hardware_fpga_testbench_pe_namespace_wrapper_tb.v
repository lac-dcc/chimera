`timescale 1ns/1ps
module pe_namespace_wrapper_tb;
// ******************************************************************
// PARAMETERS
// ******************************************************************
	parameter peId                          = 0;
	parameter logNumPe                      = 3;
	parameter memIndexLen                   = 6;
	parameter instAddrLen                   = 5;
	parameter dataAddrLen                   = 5;
	parameter weightAddrLen                 = 5;
	parameter metaAddrLen                   = 2;
	parameter dataLen                       = 16;
	parameter instLen                       = 69;
	parameter logMemNamespaces              = 2; //instruction, data, weight, meta
	parameter memDataLen                    = 16;
// ******************************************************************

// ******************************************************************
// Wires and Regs
// ******************************************************************
	//--------------------------------------------------------------------------------------
	reg                                     fail_flag;
	//--------------------------------------------------------------------------------------
	reg                                     ACLK;
	reg                                     ARESETN;
	wire                                    clk;
	wire                                    reset;
	reg										start;
	
	//from the memory to PE Namespace
	reg                                     mem_wrt_valid;
	reg  [logNumPe - 1 : 0 ]                peId_mem_in;
	reg  [logMemNamespaces - 1 : 0]         mem_data_type;
	reg  [memDataLen - 1 : 0]               mem_data_in;
	wire [memDataLen - 1 : 0]				mem_data_out;
	//--------------------------------------------------------------------------------------
	
	//from the PE Core to Memory 
	reg                                     pe_core_inst_eoc;
	wire                                    mem_wrt_back;
	wire                                    pe_namespace_wrt_done;
	
	reg                                     pe_core_inst_stall;
	reg                                     pe_core_inst_eol;
	reg [dataAddrLen - 1 : 0]               pe_core_data_rd_addr;
	
	reg [weightAddrLen - 1 : 0]             pe_core_weight_wrt_addr;
	reg                                     pe_core_weight_wrt;
	reg [dataLen - 1 : 0]                   pe_core_weight_wrt_data;
	reg [weightAddrLen - 1 : 0]             pe_core_weight_rd_addr;
	
	reg [weightAddrLen - 1 : 0]             pe_core_gradient_wrt_addr;
	reg                                     pe_core_gradient_wrt;
	reg [dataLen - 1 : 0]                   pe_core_gradient_wrt_data;
	reg [weightAddrLen - 1 : 0]             pe_core_gradient_rd_addr;
	
	reg [metaAddrLen - 1 : 0]               pe_core_meta_rd_addr;
	
	//--------------------------------------------------------------------------------------
	wire [instLen - 1 : 0]                  pe_namespace_inst_out;
	wire                                    pe_namespace_inst_valid;
	
	wire                                    pe_namespace_data_out_v;
    wire                                    pe_namespace_weight_out_v;
    wire                                    pe_namespace_gradient_out_v;
    wire                                    pe_namespace_meta_out_v;

	wire [dataLen - 1 : 0]                  pe_namespace_data_out;
	wire [dataLen - 1 : 0]                  pe_namespace_weight_out;		
	wire [dataLen - 1 : 0]                  pe_namespace_gradient_out;
	wire [dataLen - 1 : 0]                  pe_namespace_meta_out;
	
	//--------------------------------------------------------------------------------------
// ******************************************************************

assign clk = ACLK;
assign reset = !ARESETN;

/*
//--------------------------------------------------------------------------------------
task test_main;
    begin
        repeat (10000) begin
            test_random_inputs;
        end
    end
endtask
//--------------------------------------------------------------------------------------

	reg [dataLen - 1 : 0]                  mem_data_inout_reg;
    assign mem_data_inout = mem_wrt_valid ? mem_data_inout_reg : 'bz;
//--------------------------------------------------------------------------------------
task test_random_inputs;
    begin
	//mem_wrt_valid = $random;
    //mem_wrt_valid = mem_wrt_valid && !mem_wrt_back;
    mem_wrt_valid = !mem_wrt_back;
	peId_mem_in = $random;
	mem_data_type = $random;
	mem_data_inout_reg = $random;
    pe_core_inst_eoc = $random;
    @(negedge ACLK);
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task check_fail;
    if (fail_flag && !reset) 
    begin
        $display("%c[1;31m",27);
        $display ("Test Failed");
        $display("%c[0m",27);
        $finish;
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task test_pass;
    begin
        $display("%c[1;32m",27);
        $display ("Test Passed");
        $display("%c[0m",27);
        $finish;
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
initial begin
    $display("***************************************");
    $display ("Testing PE-Namespace-wrapper");
    $display("***************************************");
    fail_flag = 0;
    ACLK = 0;
    ARESETN = 1;
    @(negedge ACLK);
    ARESETN = 0;
    @(negedge ACLK);
    ARESETN = 1;

    test_main;

    test_pass;
end



always @ (posedge ACLK)
begin
    check_fail;
end
//--------------------------------------------------------------------------------------

*/
	always #5 ACLK = ~ACLK;

	initial
    begin
        $dumpfile("hw-imp/bin/waveform/pe_namespace_wrapper_tb.vcd");
        $dumpvars(0,pe_namespace_wrapper_tb);
    end
    
    initial begin
   	ACLK = 1;
   	ARESETN = 0;
   	start = 0;

	#11
	ARESETN = 1;
	mem_wrt_valid = 1;
	peId_mem_in = 0;
	mem_data_type = 0;
	mem_data_in = 'h0;//0; 
	
	//from the PE Core to Memory 
	pe_core_inst_eoc = 0;
	
	pe_core_inst_stall = 0;
	pe_core_inst_eol = 0;
	pe_core_data_rd_addr = 0;
	
	pe_core_weight_wrt_addr = 'hd;
	pe_core_weight_wrt = 0;
	pe_core_weight_wrt_data = 'hdd;
	pe_core_weight_rd_addr = 'hd;
	
	pe_core_gradient_wrt_addr = 'hd;
	pe_core_gradient_wrt = 0;
	pe_core_gradient_wrt_data ='hdd;
	pe_core_gradient_rd_addr = 'hd;
	
	pe_core_meta_rd_addr = 'hd;
	
	#10 mem_data_in = 16'b0100000000010000;
	#10 mem_data_in = 16'b0000000000000000;
	#10 mem_data_in = 16'b0000000000000000;
	#10	mem_data_in	= 16'b01010;
	
	#10 mem_data_in = 16'b0000100000000000;
	#10 mem_data_in = 16'b0100000001010000;
	#10 mem_data_in = 16'b0000000000000000;
	#10 mem_data_in = 16'b0000000010000000;
	#10	mem_data_in	= 16'b00010;
	
	#10 mem_data_in = 16'b0000000000000000;
	#10 mem_data_in = 16'b0100000010101000;
	#10 mem_data_in = 16'b0000000000000000;
	#10 mem_data_in = 16'b0000000100000000;
	#10	mem_data_in	= 16'b01010;
	
	
	#10 mem_data_type = 1;
		mem_data_in = 16'h12;
		
	#10 mem_data_type = 2;
		mem_data_in = 16'h34;
	
	#10 mem_data_type = 1;
		mem_data_in = 16'h56;
		
	#10 mem_data_type = 2;
		mem_data_in = 16'h78;
	
	#10 mem_data_type = 2;
		mem_data_in = 16'h9A;
	
	#10 mem_data_type = 3;
		mem_data_in = 16'h12;
	
	#10
	$finish;
	
	end
	
	wire [memDataLen - 1 : 0] mem_data_inout;
	
	assign mem_data_inout = mem_wrt_valid ? mem_data_in : 'bz;

	pe_namespace_wrapper
	#(
		.peId                           ( peId                          ),
		.logNumPe                       ( logNumPe                      ),
		.memIndexLen                    ( memIndexLen                   ),
		.instAddrLen                    ( instAddrLen                   ),
		.dataAddrLen                    ( dataAddrLen                   ),
		.weightAddrLen                  ( weightAddrLen                 ),
		.metaAddrLen                    ( metaAddrLen                   ),
		.dataLen                        ( dataLen                       ),
		.instLen                        ( instLen                       ),
		.logMemNamespaces               ( logMemNamespaces              ),
		.memDataLen                     ( memDataLen                    )
	) u_pe_ns_wrap (
		.clk                            ( clk                           ), //input 
   		.reset                          ( reset                         ), //input 
   		.start							( start							), //input
    	.mem_wrt_valid                  ( mem_wrt_valid                 ), //input 
    	.peId_mem_in                    ( peId_mem_in                   ), //input 
    	.mem_data_type                  ( mem_data_type                 ), //input 
    	.mem_data_inout                 ( mem_data_inout                ), //inout 
    	.pe_core_inst_eoc               ( pe_core_inst_eoc              ), //input 
   		.mem_wrt_back                   ( mem_wrt_back                  ), //output 
    	.pe_namespace_wrt_done          ( pe_namespace_wrt_done         ), //output 
    	.pe_core_inst_stall             ( pe_core_inst_stall            ), //input 
    	.pe_core_inst_eol               ( pe_core_inst_eol              ), //input 
    	.pe_core_data_rd_addr           ( pe_core_data_rd_addr          ), //input 
    	.pe_core_weight_wrt_addr        ( pe_core_weight_wrt_addr       ), //input 
    	.pe_core_weight_wrt             ( pe_core_weight_wrt            ), //input 
    	.pe_core_weight_wrt_data        ( pe_core_weight_wrt_data       ), //input 
    	.pe_core_weight_rd_addr         ( pe_core_weight_rd_addr        ), //input 
    	.pe_core_gradient_wrt_addr      ( pe_core_gradient_wrt_addr     ), //input 
    	.pe_core_gradient_wrt           ( pe_core_gradient_wrt          ), //input 
    	.pe_core_gradient_wrt_data      ( pe_core_gradient_wrt_data     ), //input 
    	.pe_core_gradient_rd_addr       ( pe_core_gradient_rd_addr      ), //input 
    	.pe_core_meta_rd_addr           ( pe_core_meta_rd_addr          ), //input 
    	.pe_namespace_inst_out          ( pe_namespace_inst_out         ), //output 
    	.pe_namespace_inst_valid        ( pe_namespace_inst_valid       ), //output 
    	.pe_namespace_data_out_v        ( pe_namespace_data_out_v       ), //output 
    	.pe_namespace_weight_out_v      ( pe_namespace_weight_out_v     ), //output 
   		.pe_namespace_gradient_out_v    ( pe_namespace_gradient_out_v   ), //output 
   		.pe_namespace_meta_out_v        ( pe_namespace_meta_out_v       ), //output 
    	.pe_namespace_data_out          ( pe_namespace_data_out         ), //output 
    	.pe_namespace_weight_out        ( pe_namespace_weight_out       ), //output 
    	.pe_namespace_gradient_out      ( pe_namespace_gradient_out     ), //output
		.pe_namespace_meta_out          ( pe_namespace_meta_out         )  //output 
	);	
	

endmodule
