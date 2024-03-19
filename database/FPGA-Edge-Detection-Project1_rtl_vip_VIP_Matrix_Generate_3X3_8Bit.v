module  VIP_Matrix_Generate_3X3_8Bit
(
    input            clk,  
    input            rst_n,
         
    input            per_frame_vsync,
    input            per_frame_href,
    input            per_frame_clken,
    input [7:0]      per_img_Y,
    
    output           matrix_frame_vsync,
    output           matrix_frame_href,
    output           matrix_frame_clken,
    output reg [7:0] matrix_p11,
    output reg [7:0] matrix_p12, 
    output reg [7:0] matrix_p13,
    output reg [7:0] matrix_p21, 
    output reg [7:0] matrix_p22, 
    output reg [7:0] matrix_p23,
    output reg [7:0] matrix_p31, 
    output reg [7:0] matrix_p32, 
    output reg [7:0] matrix_p33
);

//wire define
wire [7:0] row1_data;  
wire [7:0] row2_data;  
wire       read_frame_href;
wire       read_frame_clken;

//reg define
reg  [7:0]  row3_data;  
reg  [1:0]  per_frame_vsync_r;
reg  [1:0]  per_frame_href_r;
reg  [1:0]  per_frame_clken_r;

//*****************************************************
//**                    main code
//*****************************************************

assign read_frame_href    = per_frame_href_r[0] ;
assign read_frame_clken   = per_frame_clken_r[0];
assign matrix_frame_vsync = per_frame_vsync_r[1];
assign matrix_frame_href  = per_frame_href_r[1] ;
assign matrix_frame_clken = per_frame_clken_r[1];

//当前数据放在第3行
always@(posedge clk or negedge rst_n) begin
    if(!rst_n)
        row3_data <= 0;
    else begin
        if(per_frame_clken)
            row3_data <= per_img_Y ;
        else
            row3_data <= row3_data ;
    end
end

//用于存储列数据的RAM
line_shift_RAM_8bit  u_Line_Shift_RAM_8Bit
(
    .clock          (clk),
    .clken          (per_frame_clken),
    .per_frame_href (per_frame_href),
    
    .shiftin        (per_img_Y),   
    .taps0x         (row2_data),   
    .taps1x         (row1_data)    
);

//将同步信号延迟两拍，用于同步化处理
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        per_frame_vsync_r <= 0;
        per_frame_href_r  <= 0;
        per_frame_clken_r <= 0;
    end
    else begin
        per_frame_vsync_r <= { per_frame_vsync_r[0], per_frame_vsync };
        per_frame_href_r  <= { per_frame_href_r[0],  per_frame_href  };
        per_frame_clken_r <= { per_frame_clken_r[0], per_frame_clken };
    end
end

//在同步处理后的控制信号下，输出图像矩阵
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        {matrix_p11, matrix_p12, matrix_p13} <= 24'h0;
        {matrix_p21, matrix_p22, matrix_p23} <= 24'h0;
        {matrix_p31, matrix_p32, matrix_p33} <= 24'h0;
    end
    else if(read_frame_href) begin
        if(read_frame_clken) begin
            {matrix_p11, matrix_p12, matrix_p13} <= {matrix_p12, matrix_p13, row1_data};
            {matrix_p21, matrix_p22, matrix_p23} <= {matrix_p22, matrix_p23, row2_data};
            {matrix_p31, matrix_p32, matrix_p33} <= {matrix_p32, matrix_p33, row3_data};
        end
        else begin
            {matrix_p11, matrix_p12, matrix_p13} <= {matrix_p11, matrix_p12, matrix_p13};
            {matrix_p21, matrix_p22, matrix_p23} <= {matrix_p21, matrix_p22, matrix_p23};
            {matrix_p31, matrix_p32, matrix_p33} <= {matrix_p31, matrix_p32, matrix_p33};
        end	
    end
    else begin
        {matrix_p11, matrix_p12, matrix_p13} <= 24'h0;
        {matrix_p21, matrix_p22, matrix_p23} <= 24'h0;
        {matrix_p31, matrix_p32, matrix_p33} <= 24'h0;
    end
end

endmodule 