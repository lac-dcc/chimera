// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

/*************************************************************************
* 作者：吴文强
* 日期：2019/06/11
* 说明：ubus.v 串口虚拟总线
* 联系：xqandwn@sina.com
**************************************************************************/

module ubus
(
	input	wire		clk,
	
	// ubus write
	input	wire		ubus_wen,
	input	wire [31:0]	ubus_waddr,
	input	wire [31:0]	ubus_wdata,
	
	// ubus read
	input	wire		ubus_ren,
	input	wire [31:0]	ubus_raddr,
    output  reg			ubus_bken,
	output	reg  [31:0] ubus_rdata,
	
	// user port
    
    // led
    output  reg  [15:0] led,
    
    // tube 
    output	reg  [3:0] sm_bit1,
	output	reg  [3:0] sm_bit2,
	output	reg  [3:0] sm_bit3,
	output	reg  [3:0] sm_bit4,
    
    // flash
    output  reg         start,
    output  reg [2:0]   mod_sel,
    output  reg [23:0]  fls_addr,
    output  reg [7:0]   fls_write,
    input   wire [7:0]  fls_read,
    input   wire [15:0] id,
    input   wire        busy
);



// 串口写数据
always@(posedge clk)
begin
	if(ubus_wen)
	begin
		case(ubus_waddr)
            0: led <= ~ubus_wdata;
            1: {sm_bit4,sm_bit3,sm_bit2,sm_bit1} <= ubus_wdata;
            2: start <= ubus_wdata;
            3: mod_sel <= ubus_wdata;
            4: fls_addr <= ubus_wdata;
            5: fls_write <= ubus_wdata;
            
            
		endcase
	end
    else
        start <= 0;
end

// 串口读数据
always@(posedge clk)
begin
    if(ubus_ren)
    begin
        case(ubus_raddr)
            0: ubus_rdata <= ~led;
            // 1: ubus_rdata <= {sm_bit4,sm_bit3,sm_bit2,sm_bit1};
            6: ubus_rdata   <=   fls_read    ;        
            7: ubus_rdata   <=   id  ;        
            8: ubus_rdata   <=   busy ;             
            
        endcase
    end
end

// 串口数据返回(根据实际数据返回时间,调节对应延时)
always@(posedge clk)
begin
	ubus_bken <= ubus_ren;
end

endmodule
