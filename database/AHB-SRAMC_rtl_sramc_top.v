module sramc_top(
    //input signals
    input wire			hclk,
    input wire			sram_clk,   // hclk 的反向，与hclk属于同一个时钟沿
    input wire    		hresetn,    // 复位

    input wire    		hsel,       // AHB-Slave 有多个，此处对应的是AHB-SRAM的hsel
    input wire   	 	hwrite,     // 读/写指示
    input wire			hready,     // master -> slave，一般接常高
    input wire [2:0]  	hsize ,     // 访问数据有效字节数 
    input wire [2:0]  	hburst,     // 此处没有用到
    input wire [1:0]  	htrans,     // SEQ/NOSEQ，传输是否有效
    input wire [31:0] 	hwdata,     // 写数据
    input wire [31:0] 	haddr,      // 本次命令访问的地址		

    //Signals for BIST and DFT test mode
    //When signal"dft_en" or "bist_en" is high, sram controller enters into test mode.
    // 内建测试，测试内部的SRAM制造是否有问题，功能验证时此处接零即可，DFT工程师会专门去做的！		
    input wire            dft_en,
    input wire            bist_en,

    //output signals
    output wire         	hready_resp, // slave -> master，看 slave 是否ready，在前面介绍的规格里我们知道slave不支持反压，hready_resp 会常高
    output wire [1:0]   	hresp,       // hresp 也只会返回0，即ok状态。
    output wire [31:0] 	    hrdata,      // 从sram读出的数据

    //When "bist_done" is high, it shows BIST test is over.
    output wire        	    bist_done,
    //"bist_fail" shows the results of each sram funtions.There are 8 srams in this controller.
    output wire [7:0]       bist_fail
);

    //Select one of the two sram blocks according to the value of sram_csn
    wire [3:0] bank0_csn;
    wire [3:0] bank1_csn;

    //Sram read or write signals: When it is high, read sram; low, writesram.
    wire  sram_w_en; // hwrite is 1, write; hwrite is 0, read. 但是sram是为0时写，为1时读。所以需要一个信号去翻译AHB信号(取反)

    //Each of 8 srams is 8kx8, the depth is 2^13 (8K), so the sram's address width is 13 bits. 
    wire [12:0] sram_addr;

    //AHB bus data write into srams
    wire [31:0] sram_wdata;

    //sram data output data which selected and read by AHB bus
    wire [7:0] sram_q0;
    wire [7:0] sram_q1;
    wire [7:0] sram_q2;
    wire [7:0] sram_q3;
    wire [7:0] sram_q4;
    wire [7:0] sram_q5;
    wire [7:0] sram_q6;
    wire [7:0] sram_q7;

 
    // Instance the two modules:           
    // ahb_slave_if.v and sram_core.v      
    ahb_slave_if  ahb_slave_if_u(
        //-----------------------------------------
        // AHB input signals into sram controller
        //-----------------------------------------
        .hclk     (hclk),
        .hresetn  (hresetn),
        .hsel     (hsel),
        .hwrite   (hwrite),
        .hready   (hready),
        .hsize    (hsize),
        .htrans   (htrans),
        .hburst   (hburst),
        .hwdata   (hwdata),
        .haddr    (haddr),

        //-----------------------------------------
        //8 sram blcoks data output into ahb slave
        //interface
        //-----------------------------------------
        .sram_q0   (sram_q0),
        .sram_q1   (sram_q1),
        .sram_q2   (sram_q2),
        .sram_q3   (sram_q3),
        .sram_q4   (sram_q4),
        .sram_q5   (sram_q5),
        .sram_q6   (sram_q6),
        .sram_q7   (sram_q7),

        //---------------------------------------------
        //AHB slave(sram controller) output signals 
        //---------------------------------------------
        .hready_resp  (hready_resp),
        .hresp        (hresp),
        .hrdata       (hrdata),

        //---------------------------------------------
        //sram control signals and sram address  
        //---------------------------------------------
        // 四组信号：读写指示、数据、地址、片选
        .sram_w_en    (sram_w_en),
        .sram_addr_out(sram_addr),
        //data write into sram
        .sram_wdata   (sram_wdata),
        //choose the corresponding sram in a bank, active low
        .bank0_csn    (bank0_csn),
        .bank1_csn    (bank1_csn)
    );

  
    sram_core  sram_core_u(
        //AHB bus signals
        .hclk        (hclk    ),
        .sram_clk    (sram_clk),
        .hresetn     (hresetn ),

        //-------------------------------------------
        //sram control singals from ahb_slave_if.v
        //-------------------------------------------
        .sram_addr    (sram_addr ),
        .sram_wdata_in(sram_wdata),
        .sram_wen     (sram_w_en ),
        .bank0_csn    (bank0_csn ),
        .bank1_csn    (bank1_csn ),

        //test mode enable signals
        .bist_en      (bist_en   ),
        .dft_en       (dft_en    ),

        //-------------------------------------------
        //8 srams data output into AHB bus
        //-------------------------------------------
        .sram_q0    (sram_q0),
        .sram_q1    (sram_q1),
        .sram_q2    (sram_q2),
        .sram_q3    (sram_q3),
        .sram_q4    (sram_q4),
        .sram_q5    (sram_q5),
        .sram_q6    (sram_q6),
        .sram_q7    (sram_q7),

        //test results output when in test mode
        .bist_done  (bist_done),
        .bist_fail  (bist_fail)
    );
  
endmodule

