module ahb_slave_if(
    //               AHB信号列表
    // singals used during normal operation
    input  hclk,
    input  hresetn,
    // signals from AHB bus during normal operation
    input  hsel,                   //hsel恒为1，表示选中该SRAMC
    input  hready,                 //由Master总线发出，hready=1，读/写数据有效；否则，无效
    input  hwrite,                 //hwrite=1，写操作；hwrite=0，读操作
    input  [1:0]   htrans,         //当前传输类型10：NONSEQ，11：SEQ(命令是否有效)
    input  [2:0]   hsize,          //每一次传输的数据大小，支持8/16/32bit传输
    input  [2:0]   hburst,         //burst操作，该项目无用，置0即可
    input  [31:0]  haddr,          //AHB：32位系统总线地址
    input  [31:0]  hwdata,         //AHB：32位写数据操作
    // signals from sram_core data output (read srams)
    input  [7:0]  sram_q0,              //表示读取sram数据信号
    input  [7:0]  sram_q1,              //8片RAM的返回数据
    input  [7:0]  sram_q2,              //可以根据hsize和haddr判断哪一片RAM有效
    input  [7:0]  sram_q3,
    input  [7:0]  sram_q4,
    input  [7:0]  sram_q5,
    input  [7:0]  sram_q6,
    input  [7:0]  sram_q7,

    // signals to AHB bus used during normal operation 
    //（读数据输出->进入AHB总线），即返回给Master的相关信号
    output  [1:0]  hresp,             //状态信号，判断hrdata读数据是否出错；00：OKAY，01：ERROR传输错误
    output         hready_resp,       //判断hrdata是否有效，hready_out
    output  [31:0] hrdata,            //读数据信号

    // sram read or write enable signals，
    // 以下5个信号为返回给RAM的信号
    // when “sram_w_en” is low, it means write sram, when "sram_w_en" is high, it means read sram,
    output  sram_w_en,         //写使能信号，0：写；1：读

    // choose the write srams when bank is confirmed
    // bank_csn allows the four bytes in the 32-bit width to be written independently
    output  [3:0]  bank0_csn,
    output  [3:0]  bank1_csn,

    // signals to sram_core in normal operation, it contains sram address and data writing into sram 
    //（写数据输出->进入sram存储单元）
    output  [12:0]  sram_addr_out,          // 地址输出进入sram，13位地址（8k=2^3*2^10=2^13）
    output  [31:0]  sram_wdata              //写数据进入sram
); 

    // internal registers used for temp the input ahb signals （临时信号）
    // temperate all the AHB input signals
    reg         hwrite_r;         //_r:表示这些信号会经过寄存器寄存一拍；
    reg  [2:0]  hsize_r;          //因为AHB协议传输分为地址阶段和数据阶段两个部分，而SRAM的地址和数据是在同一拍进行传输，
    reg  [2:0]  hburst_r;         //AHB的地址和控制信号会在数据信号的前一拍生效，所以，为了将AHB与SRAM之间的协议进行转换，
    reg  [1:0]  htrans_r;         //使数据对齐，需将AHB的地址与控制信号打一拍再传输，这样传入SRAM的地址和数据便处于同一拍，
    reg  [31:0] haddr_r;          //以满足SRAM的时序要求。

    reg  [3:0]  sram_csn;         //内部信号，由于sram分为bank0和bank1两部分，在进行读写数据时，首先会根据地址范围判断选中bank0
                                  //或者bank1，再根据hsize_r和haddr_r来确定具体访问到bank0/bank1中的具体哪一片sram。
    // Internal signals    中间信号
    // “haddr‘_sel” and "hsize_sel" used to generate banks of sram: "bank0_sel" and "bank1_sel"
    wire  [1:0]  haddr_sel;
    wire  [1:0]  hsize_sel;
    wire         bank_sel;

    wire         sram_csn_en;     //sram片选使能信号

    wire         sram_write;     //来自AHB总线的sram写使能信号
    wire         sram_read;      //来自AHB总线的sram读使能信号
    wire  [15:0] sram_addr;      //来自AHB总线的sram地址信号，64K=2^5*2^10=2^15
    wire  [31:0] sram_data_out;  //从sram发出的读数据信号，发送至AHB总线

    // transfer type signal encoding
    parameter   IDLE = 2'b00,         //定义htrans的状态
                BUSY = 2'b01,
                NONSEQ = 2'b10,        //数据传输有效
                SEQ = 2'b11;           //数据传输有效


//--------------------------------------------------------------------------------------------------------
//----------------------------------------------Main code，主代码------------------------------------------
//--------------------------------------------------------------------------------------------------------


    // Combitional portion ,     组合逻辑部分
    // assign the response and read data of the AHB slave
    // To implement sram function-writing or reading in one cycle, value of hready_resp is always "1"
    assign  hready_resp = 1'b1;    //hready_resp恒为1，不支持反压，由Slave返回给Master，读/写数据可在一个循环内完成
    assign  hresp       = 2'b00;   //00表示hrdata读数据OKAY，不支持ERROR、RETRY、SPLIT,只返回OKAY状态

    // sram data output to AHB bus
    assign  hrdata = sram_data_out;  //由sram存储单元输出数据，经hrdata导出至AHB总线，支持8/16/32bit位

    // Generate sram write and read enable signals
    assign  sram_write = ((htrans_r == NONSEQ) || (htrans_r == SEQ)) && hwrite_r;
    assign  sram_read = ((htrans_r == NONSEQ) || (htrans_r == SEQ)) && (! hwrite_r);
    assign  sram_w_en = !sram_write;     //SRAM写使能为0，代表写；为1，代表读；其含义与由总线产生的sram_write中间信号相反


    // Generate sram address 
    // 系统逻辑地址(eg:CPU)看到的空间是 0 1 2 3 4 5 6 7 8 ...，但是访问的时候总线位宽是32bit，所以访问地址依次是0 4 8 C。
    // 但是对于SRAM这个存储介质来讲，看到的空间是实际的物理地址，每个地址是由32bit组成的，所以访问地址依次是:0 1 2 3
    assign  sram_addr = haddr_r[15:0];      //系统内存空间：64K=2^6*2^10=2^16,即系统地址由16根地址线组成——系统地址
    assign  sram_addr_out = sram_addr[14:2];//物理地址=系统地址/4，即右移两位，64KB=8*8K*8bit，每一片SRAM地址深度为8K=2^13,有13根地址线（详细原因参考后文）

    // Generate bank select signals by the value of sram_addr[15].
    // Each bank(32K*32）comprises of four sram block(8K*8), and the width of the address of the bank is
    // 15 bits(14-0),so the sram_addr[15] is the minimum of the next bank. if it is value is '1', it means 
    // the next bank is selected.
    assign sram_csn_en = (sram_write || sram_read); 

    //片选使能为1且sram_addr[15]为0，表示选中bank0，接着再根据sram_csn选中bank0中4个RAM的某几个RAM（详细原因参考后文）
    assign  bank0_csn = (sram_csn_en && (sram_addr[15] == 1'b0))?sram_csn:4'b1111;  //系统地址的最高位为sram_addr[15],用来判断访问sram的bank0还是bank1
    assign  bank1_csn = (sram_csn_en && (sram_addr[15] == 1'b1))?sram_csn:4'b1111;  //sram_addr[15]=0 访问bank0；sram_addr[15]=1 访问bank1 因为是均分的BANK

    assign  bank_sel = (sram_csn_en && (sram_addr[15] == 1'b0))?1'b1:1'b0; //bank_sel为1代表bank0被访问；bank_sel为0代表bank1被访问 
    // Choose the right data output of two banks(bank0,bank1) according to the value of bank_sel.
    // If bank_sel = 1'b1, bank1 selected;or, bank0 selected.
    assign  sram_data_out = (bank_sel) ? {sram_q3,sram_q2,sram_q1,sram_q0}:         //对sram的数据输出进行选择
                                         {sram_q7,sram_q6,sram_q5,sram_q4};

    // signals used to generating sram chip select signal in one bank.
    assign  haddr_sel = sram_addr[1:0];    //通过sram的地址低两位和hsize_r信号判断选择4片sram中的具体哪一片
    assign  hsize_sel  = hsize_r[1:0];

    // data from AHB writing into sram.
    assign  sram_wdata =hwdata;   //将通过AHB的数据写进sram存储单元中

// Generate the sram chip selecting signals in one bank.
// results show the AHB bus write or read how many data once a time:byte(8),halfword(16) or word(32).
    always@(hsize_sel or haddr_sel) begin
        if(hsize_sel == 2'b10)            //32bits:word operation，4片sram都会进行访问
          sram_csn = 4'b0;                //active low，sram_csn信号低有效，4‘b0000代表4片SRAM都被选中
        else if(hsize_sel == 2'b01)       //16bits:halfword，选中4片中的其中两片（前两片或者后两片）
          begin
            if(haddr_sel[1] == 1'b0)      //low halfword，若地址的低两位为00，则访问低16位；如为10，则访问高16位（详细原因参考后文）
              sram_csn = 4'b1100;         //访问低两片SRAM（低16bit）
            else                          //high halfword
              sram_csn = 4'b0011;         //访问高两片SRAM（高16bit）
          end
        else if(hsize_sel == 2'b00)       //8bits:byte，访问4片sram中的一片
          begin
            case(haddr_sel)
              2'b00:sram_csn = 4'b1110;    //访问最右侧的sram
              2'b01:sram_csn = 4'b1101;    //访问最右侧左边第一片sram
              2'b10:sram_csn = 4'b1011;    //访问最左侧右边第一片sram
              2'b11:sram_csn = 4'b0111;    //访问最左侧的sram
              default:sram_csn = 4'b1111;  //不会出现这种情况，haddr_sel只有上述所列00、01、10、11四种情况
            endcase
          end
        else
          sram_csn = 4'b1111;      //不会出现这种情况，四片sram都不会被选中，hready常高，连续流水进行读写操作
    end

// Sequential portion,     时序逻辑部分(SRAM 地址和数据要对齐，所以将AHB两拍转一拍)
// tmp the ahb address and control signals
    always@(posedge hclk or negedge hresetn) begin
        if(!hresetn)
          begin
            hwrite_r <= 1'b0;
            hsize_r  <= 3'b0;
            hburst_r <= 3'b0;         //可在RTL代码中删除，无用
            htrans_r <= 2'b0;
            haddr_r  <= 32'b0;
          end
        else if(hsel && hready)
          begin
            hwrite_r <= hwrite;
            hsize_r  <= hsize;       //由于sram的地址和数据在同一拍，所以需要将AH包的
            hburst_r <= hburst;      //地址和控制信号寄存一拍，使其与数据对齐
            htrans_r <= htrans;
            haddr_r  <= haddr;
          end
        else
          begin
            hwrite_r <= 1'b0;
            hsize_r  <= 3'b0;
            hburst_r <= 3'b0;         //可在RTL代码中删除，无用
            htrans_r <= 2'b0;
            haddr_r  <= 32'b0;
          end
    end

endmodule


