// This program was cloned from: https://github.com/thoulee21/ADC-FPGA
// License: Apache License 2.0

module box_ave #(
parameter ADC_WIDTH = 8,				// ADC精度，单位bit
parameter LPF_DEPTH_BITS = 4         // 低通滤波器深度，2^LPF_DEPTH_BITS是抽取率
)(
input   clk,            // 时钟
input   rstn, // 复位，低电平有效
input	sample,// 输入有效，高电平
input	[ADC_WIDTH-1:0]	raw_data_in,// 数据输入
output reg [ADC_WIDTH-1:0]	ave_data_out,// 滤波后输出
output data_out_valid // 输出数据有效
);
		
//**********************************************************************
//
//	内部连线，寄存器声明
//
//**********************************************************************
reg [ADC_WIDTH+LPF_DEPTH_BITS-1:0]      accum;          // 累加寄存器
reg [LPF_DEPTH_BITS-1:0]                count;          // 计数器
reg [ADC_WIDTH-1:0]  					raw_data_d1;    // 流水线寄存器

reg sample_d1, sample_d2;                               // 数据有效打拍
reg result_valid;                                       // 结果有效寄存器
wire latch_result;                                      // 锁存结果数据

//***********************************************************************
//
//  Rising Edge Detection and data alignment pipelines
//
//***********************************************************************
always @(posedge clk or negedge rstn)
begin
	if( ~rstn ) begin
		sample_d1 <= 0;	
		sample_d2 <= 0;
        raw_data_d1 <= 0;
		result_valid <= 0;
	end else begin
		sample_d1 <= sample;                // 各种信号打拍
		sample_d2 <= sample_d1;             
		raw_data_d1 <= raw_data_in; 	    
		result_valid <= latch_result;		
	end
end

assign		latch_result = sample && (count == 0);	// 计数器为0且新的数据到达，数据锁存指示

//***********************************************************************
//
//  累加时序控制
//
//***********************************************************************
always @(posedge clk or negedge rstn)
begin
	if( ~rstn ) begin
		count <= 0;	  
	end else begin
	    if (sample)	
	    	count <= count + 1;         // 计数器+1
	end
end


//***********************************************************************
//
//  数据累加
//
//***********************************************************************
always @(posedge clk or negedge rstn)
begin
	if( ~rstn ) begin
		accum <= 0;	
	end else begin
        if (sample)
            if(count == 0)                      // 累加结束，
    		    accum <= raw_data_d1;           // 写入新数据
            else
                accum <= accum + raw_data_d1;   // 累加中
	end	
end
	
//***********************************************************************
//
//  锁存结果
//	把累加器的值进行移位，代替除法
//
//***********************************************************************
always @(posedge clk or negedge rstn)
begin
	if( ~rstn ) begin
        ave_data_out <= 0;
    end else if (latch_result) begin            // 如果锁存结果
        ave_data_out <= accum >> LPF_DEPTH_BITS;	  // 右移LPF_DEPTH_BITS位，等效/(2^LPF_DEPTH_BITS)
    end
end

assign data_out_valid = result_valid;       // 输出数据有效信号

endmodule