// cpu_qsys_comp.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module cpu_qsys_comp (
		input  wire        cpu_clock_clk,           //      cpu_clock.clk
		input  wire        debugger_clock_clk,      // debugger_clock.clk
		input  wire        reset_n,                 //   global_reset.reset_n
		output wire        inst_master_read,        //    inst_master.read
		output wire        inst_master_write,       //               .write
		output wire [31:0] inst_master_address,     //               .address
		output wire [3:0]  inst_master_byteenable,  //               .byteenable
		input  wire [31:0] inst_master_readdata,    //               .readdata
		output wire [31:0] inst_master_writedata,   //               .writedata
		input  wire        inst_master_waitrequest, //               .waitrequest
		output wire        data_master_read,        //    data_master.read
		output wire        data_master_write,       //               .write
		output wire [31:0] data_master_address,     //               .address
		output wire [3:0]  data_master_byteenable,  //               .byteenable
		input  wire [31:0] data_master_readdata,    //               .readdata
		output wire [31:0] data_master_writedata,   //               .writedata
		input  wire        data_master_waitrequest, //               .waitrequest
		output wire          io_master_read,        //      io_master.read
		output wire          io_master_write,       //               .write
		output wire [31:0]   io_master_address,     //               .address
		output wire [3:0]    io_master_byteenable,  //               .byteenable
		input  wire [31:0]   io_master_readdata,    //               .readdata
		output wire [31:0]   io_master_writedata,   //               .writedata
		input  wire          io_master_waitrequest, //               .waitrequest
		input  wire [4:0]  inr_irq0_irq,            //       inr_irq0.irq
    output reg[127:0] trace_data,
    output reg[1:0] trace_en,
      output wire        dbg_txd,                 //       debugger.dbg_txd
      input  wire        dbg_rxd                  //               .dbg_rxd

	);

wire        uni_master_read;        //     uni_master.read
wire        uni_master_write;       //               .write
wire [31:0] uni_master_address;     //               .address
wire [3:0]  uni_master_byteenable;  //               .byteenable
wire [31:0] uni_master_readdata;    //               .readdata
wire [31:0] uni_master_writedata;   //               .writedata
wire        uni_master_waitrequest; //               .waitrequest

wire dbus_uncached;

assign dbus_uncached = uni_master_address[28];

assign { uni_master_readdata,  uni_master_waitrequest} = dbus_uncached ? 
       {  io_master_readdata,   io_master_waitrequest}:
       {data_master_readdata, data_master_waitrequest};

assign {  io_master_read,   io_master_write,   io_master_address,   io_master_byteenable,   io_master_writedata} = dbus_uncached?
       { uni_master_read,  uni_master_write,  uni_master_address,  uni_master_byteenable,  uni_master_writedata} :
       {            1'b0,              1'b0,               32'b0,                   4'b0,                 32'b0};
       
assign {data_master_read, data_master_write, data_master_address, data_master_byteenable, data_master_writedata} = dbus_uncached?
       {            1'b0,              1'b0,               32'b0,                   4'b0,                 32'b0} :
       { uni_master_read,  uni_master_write,  uni_master_address,  uni_master_byteenable,  uni_master_writedata};

naive_mips cpu(
         .ibus_address(inst_master_address),
         .ibus_byteenable(inst_master_byteenable),
         .ibus_read(inst_master_read),
         .ibus_write(inst_master_write),
         .ibus_wrdata(inst_master_writedata),
         .dbus_address(uni_master_address),
         .dbus_byteenable(uni_master_byteenable),
         .dbus_read(uni_master_read),
         .dbus_write(uni_master_write),
         .dbus_wrdata(uni_master_writedata),
         .rst_n(reset_n),
         .clk(cpu_clock_clk),
         .debugger_uart_clk(debugger_clock_clk),
         .debugger_uart_rxd(dbg_rxd),
         .debugger_uart_txd(dbg_txd),
         .ibus_rddata(inst_master_readdata),
         .ibus_stall(inst_master_waitrequest & (inst_master_read|inst_master_write)),
         .dbus_rddata(uni_master_readdata),
         .dbus_stall(uni_master_waitrequest & (uni_master_read|uni_master_write)),
         .hardware_int_in(inr_irq0_irq),
         .dbus_uncached());


always @(posedge cpu_clock_clk or negedge reset_n) begin
    if (!reset_n) begin
        trace_en <= 2'b0;
    end
    else begin
        trace_en[0] <= (inst_master_read|inst_master_write) & ~inst_master_waitrequest;
        trace_data[31:0] <= {1'b0, inst_master_write, inst_master_address[29:0]};
        trace_data[63:32] <= inst_master_write ? inst_master_writedata : inst_master_readdata;

        trace_en[1] <= (data_master_read|data_master_write) & ~data_master_waitrequest;
        trace_data[95:64] <= {1'b1, data_master_write, data_master_address[29:0]};
        trace_data[127:96] <= data_master_write ? data_master_writedata : data_master_readdata;
    end
end

endmodule
