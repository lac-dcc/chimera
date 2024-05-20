// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/18 04:10:02
// Design Name: 
// Module Name: CheckSum_Generation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//assign 语句左值只能是线网型，过程赋值语句左值不能是线网型
//目前这个阶段，走通错误检测，正常计算过程的校验和产生电路设计与验证
//fetch_A之后才fetch_B，这是两个分立的时序过程，需要一系列内部寄存器                            
//下一步的目标：解决在写矩阵C的对应行阶段generate_enable信号拉低造成的memAc,memBr,count_for_Ac_row发生变化的问题，同时处理好full[2:0]信号的设置问题
//下下步目标，在错误检测工作一圈后，错误纠正工作时的两次计算怎么设置相关寄存器包括，count_for_Ac_row等，模块需要拉出一个外部输入信号来标记这样的状态
//理想的spec:在写矩阵C的相关行状态,校验和产生模块的generate_enable拉低,所以需要一个内部计数器来控制count_for_Ac_row的复位,以及memAc,memBr的复位问题,可以看出,只有在detect_correct = 2'd1时,两个存储器才会复位

module CheckSum_Generation(
    input [1023:0] data_in,//原始数据输入
    input [4:0] mux_sel,
    input clk,
    input [1:0] detect_correct,//决定校验和产生模块工作在哪个过程,当detect_correct = 2'd1时,工作在正常计算,错误检测模式,当detect_correct = 2'd2时,工作在错误纠正第一次计算模式,当detect_correct = 2'd3时,工作在错误纠正第二次计算模式
    input generate_enable,//使能校验和产生模块
    input fetch_A,//通知校验和产生模块取矩阵A的对应行
    input fetch_B,//通知校验和产生模块取矩阵B的全部行

    output [31:0] dataAc_out,//列编码矩阵Ac对应行对应元素输出
    output [1055:0] dataBr_out,//行编码矩阵Br对应行输出
    //output dataAc_out_ready,//原始矩阵A编码完成，dataAc_out[31:0]端口数据有效信号，由于端口dataAc_out从MUX输出，不对应时序过程，从data_in取得数据打入寄存器后fetch_A_ready拉高
    output dataBr_out_ready,//原始矩阵B编码完成，dataBr_out[1055:0]端口数据有效信号，对应Br的一行正确执行完编码动作放到输出数据端口，这个信号给到后面的循环移位器模块
    output fetch_A_ready,//从TestBench取得相应矩阵A对应行完成，并且编码完成
    output fetch_B_ready,//从TestBench取得相应矩阵B全部行完成，对应Br的全部行正确执行完编码动作放到输出数据端口，这个信号给到状态机
    output [2:0] full//列编码Ac的全部行取出完成,full [2:0] = 3'b001表示正常计算（错误检测完成），full[2:0] = 3'b010表示错误纠正部分第一次计算完成，full[2:0] = 3'b100表示错误纠正部分第二次计算完成
    );
    //////////////////////////////变量定义/////////////////////////////////
    ////////////内部寄存器变量/////////////////////////////////////////////
    ////存数据//////////////////////////////////////////////////////////////
    //存放Br最后一列的存储器
    reg [31:0] memBr [0:31]; //寄存器申明的结构顺序和我在代码中用下表索引的逻辑顺序是不同的，决定累加中各矩阵元素之间的索引使用的是逻辑顺序，也就是可以不用在意定义时的结构顺序
    //存放Ac最后一行的存储器
    reg [31:0] memAc [0:31];
    reg [31:0] I_dataAc_in [31:0];//从输入端口暂时取得原始矩阵A的对应行时的暂存寄存器
    //为计算矩阵B校验和新增一些中间变量
    reg [31:0] add_result;
    reg [31:0] accumulation_result; 
    ////存标志位///////////////////////////////////////////////////////////
    reg fetch_A_last,
        fetch_A_rising_edge;
    reg fetch_B_last,
        fetch_B_rising_edge;
    reg flag_fetch_A_over,//标志取完一次矩阵A的对应行
        flag_encode_B_row_over;//标志编码矩阵B的对应行工作完成
    reg [1:0] detect_correct_last;
    reg flag_detect_correct;//值为1时，表示detect_correct信号发生变化
    reg flag_reset_entry_A;//该信号值为1，表示不让电路落入取数矩阵A状态,这个信号的引出是依据波形图仿真1765ns处的波形情况得出
    //为了使fetch_A_ready信号拉高后经过3个时钟周期自动拉低，设置一个标志寄存器，和计数器
    reg flag_control_fetch_A_ready;//拉高表示对fetch_A_ready信号进行脉冲宽度控制
    reg flag_initial;//值为1时，进入初始化状态
    reg flag_memAc_over,
        flag_memBr_over;//当这两个寄存器值为1'b1时，表示存储器已经编码完成
    reg fetchA_deco_compare;//值为1时，说明detect_correct[1:0]信号和fetch_A信号同时变化，让detect_correct的行为先进行
    reg flag_control_dataBr_out_ready;//值为1表示对dataBr_out_ready信号进行脉冲宽度延长控制
    reg flag_add_rising_edge_of_dataBr_out_ready;//值为1表示
    ////计数器/////////////////////////////////////////////////////////////
    integer i;//计数变量
    reg [5:0] count_for_Ac_row;//计数Ac第几行的计数器，6位宽，值表示为0~32即可
    reg [5:0] count_for_Br_row;//计数在生成矩阵Cf相关行的循环中取矩阵Br第几行的计数器，6位宽，相当于MACs.v中的count计数器
    reg [5:0] count_for_row_of_Br_accumulation;//计算矩阵B对应行校验和时的计数器，矩阵B一行33个元素，计算校验和时计数33次
    reg [1:0] count_for_hold_fetch_A_ready;//让fetch_A_ready信号拉高后经过4个时钟周期自动拉低的计数器
    reg [1:0] count_for_hold_dataBr_out_ready;//让dataBr_ready信号拉高后经过4个时钟周期自动拉低的计数器
    reg [5:0] count_for_add_rising_edge_of_dataBr_out_ready;//计数dataBr_out_ready信号增加拉高拉低次数的计数器
    ///////////连接到输出端口的寄存器型变量/////////////////////////////////
    reg [31:0] I_dataBr_in [31:0];//从输入端口暂时取得原始矩阵B的对应行时的暂存寄存器
    reg [2:0] O_full;
    reg O_fetch_A_ready,
        O_fetch_B_ready,
        O_dataBr_out_ready;
    ///////////连接到输出端口的线网型变量/////////////////////////////////
    wire [31:0] wire_dataAc_out [1:0];//两个mux32例化的输出端口，通过一个assign语句选择是wire_dataAc_out[1]还是wire_dataAc_out[0]输出
    //考虑fetch_A信号和detect_correct信号同时变化这一动作优先级
    always @(posedge clk) begin
        ///////////////同步复位功能/////////////////////////////////////////////////////复位的目的是让电路进入一个最安全的状态
        fetch_A_last <= fetch_A;
        fetch_A_rising_edge <= (!fetch_A_last&&fetch_A);
        fetch_B_last <= fetch_B;
        fetch_B_rising_edge <= (!fetch_B_last&&fetch_B);

        if(fetch_A_rising_edge||(fetchA_deco_compare == 1'b1))begin
            if(flag_detect_correct) begin
                fetchA_deco_compare <= 1'b1;
            end else begin
                O_fetch_A_ready <= 1'b0;//其实这个在fetch_A拉高后第一个上升沿同步复位过程中是不必要的，因为fetch_A_ready拉高后三个时钟周期就会拉低
                flag_fetch_A_over <= 1'b0;//说明需要取数矩阵A
                count_for_hold_fetch_A_ready <= 2'd0;
                flag_control_fetch_A_ready <= 1'b0;
                fetchA_deco_compare <= 1'b0;
                flag_reset_entry_A <= 1'b0;
            end
        end

        if(fetch_B_rising_edge)begin //计算Cf全部行的过程中，fetch_B_rising_edge拉高32次
            //控制大时序过程开始结束的信号
             O_fetch_B_ready <= 1'b0;
            //控制小时序过程开始结束的信号
            count_for_Br_row <= 6'd0;//计数当前取矩阵B的全行操作时正在取矩阵B的第几行，一个fetch_A操作映射矩阵B取全部行的操作
            flag_encode_B_row_over <= 1'b0;//矩阵B处于行编码状态的信号，这个信号值为1时，矩阵B处于行编码状态
            O_dataBr_out_ready <= 1'b0;//矩阵B对应行准备好的指示信号
            flag_control_dataBr_out_ready <= 1'b0;
            count_for_hold_dataBr_out_ready <= 2'b00;
            count_for_add_rising_edge_of_dataBr_out_ready <= 6'd0;
            flag_add_rising_edge_of_dataBr_out_ready <= 1'b0;
        end

        //////////////检测detect_correct信号是否发生变化//////////////////////////////////////////////////////////////
        /////////////这里需要考虑fetch_A和detect_correct信号同时变化的问题
            detect_correct_last <= detect_correct;
            flag_detect_correct <= (detect_correct !== detect_correct_last)&&(detect_correct_last !== 2'bxx);//逻辑与后面的项的写法是从波形图上得出的规律
        //三个模式间切换都有初始化，需要对detect_correct信号进行判断
        //////////////初始化：针对原来detect_correct[1:0]输入信号进行修改////////////////////////////////////////////////////////////////初始化选择进入的模式
        if(flag_detect_correct)begin
            case(detect_correct)
                2'd1://这个很好解释，每次对矩阵乘法的正常运算和容错期间的两次计算是针对特定的矩阵A和矩阵B的，也就是说每次矩阵A和矩阵B都不同的话，memBr,memAc复位是合理的，反映在代码上就是从IDLE状态跳转到Buffer_row_A状态
                 //memBr,memAc每次都需要被改变
                    begin
                        for (i = 0;i < 32 ;i = i + 1 ) begin //刚刚进入错误检测，正常计算状态时，detect_correct = 2'd1
                            memBr[i] <= 32'd0;
                            memAc[i] <= 32'd0;
                        end
                            count_for_Ac_row <= 6'd0;
                            flag_memAc_over <= 1'b0;//就是说从IDLE状态跳转到错误检测状态内部存储器都是未被编码完成的
                            flag_memBr_over <= 1'b0;//只有从IDLE状态第一次跳转到错误检测&&正常计算状态才需要第一次编码矩阵B,所以拉低这个信号
                    end
                2'd2:
                    begin
                            count_for_Ac_row <= 6'd0;
                    end
                2'd3:
                    begin
                            count_for_Ac_row <= 6'd0;
                    end
                default:
                    begin
                            count_for_Ac_row <= count_for_Ac_row;
                    end
            endcase
        end
        
        if(generate_enable)begin
            ////////////////////////////////////////////////////////////////////主处理逻辑分取数和算数部分///////////////////////////////////////////////////////////
            ///////////////////////////////////////////////取数:矩阵A 相关控制信号：generate_enable,fetch_A,fetch_A_ready////////////////////////////////////////////
            if(!O_fetch_A_ready&&fetch_A&&!flag_fetch_A_over&&!flag_reset_entry_A)begin
                for (i = 0;i < 32 ;i = i + 1 ) begin
                    I_dataAc_in[i] <= data_in[32*i+:32];
                end
                flag_fetch_A_over <= 1'b1;//区分对矩阵A取数和计算校验和的变量
                count_for_Ac_row <= count_for_Ac_row + 1'b1; //每取矩阵A的一行进行一次计数器自增
            end

            //////////////////////////////////////////////////////////算数矩阵A,主要是对memAc进行累加操作，算数落后取数一个周期//////////////////////////////////////////////////////
            //存储器memAc未生成完成
            if(!O_fetch_A_ready&&fetch_A&&flag_fetch_A_over&&!flag_memAc_over) begin //对第33次取数操作,memAc不进行累加操作,输出信号dataAc_out直接从memAc拿
                if(count_for_Ac_row < 6'd33) begin //找到编码部分的代码和其它标志信号部分的代码，
                    for(i = 0; i < 32; i = i + 1)begin
                        memAc[i] <= memAc[i] + I_dataAc_in[i];
                    end
                end
                O_fetch_A_ready <= 1'b1;//O_fetch_A_ready通知本模块外的各模块当前阶段矩阵A已经编码好，并且相关mux已经将矩阵A的对应行选择好输出给dataAc_out,而且通知取数逻辑不要再取数
                //给reg_full信号赋值，当count_for_Ac_row等于6'd33时
                O_full <= (count_for_Ac_row == 6'd33) ? ((detect_correct == 2'd1) ? 3'd1 : ((detect_correct == 2'd2) ? 3'd2 :((detect_correct == 2'd3) ? 3'd4 : 3'd0))) : 3'd0;
                flag_memAc_over <= (flag_memAc_over) ? 1'b1 : ((count_for_Ac_row == 6'd33) ? 1'b1 : 1'b0); //flag_memAc_over由自己本身的状态和count_for_row_Ac的计数值决定，本质上?之前的判断条件是无用的
                flag_control_fetch_A_ready<=1'b1;//对fetch_A_ready信号进行高电平脉冲宽度控制
            end
            //存储器memAc生成完成，通过flag_memAc_over这个标志来区分
            if(!O_fetch_A_ready&&fetch_A&&flag_fetch_A_over&&flag_memAc_over) begin
                O_fetch_A_ready <= 1'b1;
                O_full <= (count_for_Ac_row == 6'd33) ? ((detect_correct == 2'd1) ? 3'd1 : ((detect_correct == 2'd2) ? 3'd2 :((detect_correct == 2'd3) ? 3'd4 : 3'd0))) : 3'd0;
                flag_control_fetch_A_ready <= 1'b1;
            end
            //对fetch_A_ready信号进行高电平脉冲宽度控制
            if(flag_control_fetch_A_ready) begin
                if(!fetch_A_rising_edge&&!fetchA_deco_compare) begin //同步复位优先级高于高电平脉冲宽度控制,之前那种写法会造成count_for_hold_fetch_A_ready在一个always块内的多驱动
                    if(count_for_hold_fetch_A_ready < 2'b11) begin
                        count_for_hold_fetch_A_ready <= count_for_hold_fetch_A_ready + 1'b1;
                    end
                    if(count_for_hold_fetch_A_ready == 2'b11)begin
                        flag_control_fetch_A_ready <= 1'b0;//结束对fetch_A_ready信号的高电平脉冲宽度控制
                        O_fetch_A_ready <= 1'b0;
                        flag_fetch_A_over <= 1'b0;//波形图上得出的规律，不知道对否
                        flag_reset_entry_A <= 1'b1;//该信号值为1，表示不让电路落入取数矩阵A状态
                    end
                end          
            end
            //////////////////////////////////////////////////////////取数:矩阵B 相关控制信号：generate_enable,fetch_B,fetch_B_ready,dataBr_out_ready///////////////////////////
            //时序过程没有分清楚：(1)取矩阵B的全行32次，由count_for_Br计数
            ////////////////////(2)第一次取矩阵B的全行时，需要一行一行编码，直到flag_memBr_over = 1'b0
            ////////////////////(3)flag_memBr_over = 1'b1完成后，还需要取矩阵B的剩下31行，空转编码操作
            if(fetch_B&&!O_fetch_B_ready&&!flag_encode_B_row_over&&!flag_control_dataBr_out_ready) begin//取端口数据，给矩阵B编码，存在memBr中，当count_for_Ac_row的值不为0时，不改变memBr的值
            //把矩阵B的相关行取回来，这时候需要等待一些时钟周期完成矩阵B的编码工作，该工作完成后发出一个信号进行取下一个数的操作，现在就需要设置这样一个信号，本质上是一个内部寄存器，这在硬件上通过一个乘法累加器完成
                for (i = 0;i < 32 ;i = i + 1 ) begin
                    I_dataBr_in[i] <= data_in[32*i+:32];
                end
                if(count_for_Br_row == 6'd32) begin
                    count_for_Br_row <= 6'd1; //因为这个计数器的值表示当前取的矩阵B的行标号，1代表取完了矩阵B的第一行，32代表取完了矩阵B的第32行
                end else begin
                    count_for_Br_row <= count_for_Br_row + 1'b1;
                end
                //下面这两个变量的意思是取出了对应行后，就对应编码矩阵B对应行的状态，你编码矩阵B对应行也要清零累加寄存器
                flag_encode_B_row_over <= 1'b1;//该信号为1表示处于矩阵B的对应行处于编码状态，这时reg_dataBr_out中已经放好了待乘累加的32个元素
                count_for_row_of_Br_accumulation <= 6'd0;//如果memBr计算完成，这个计数器的值始终为0
                O_dataBr_out_ready <= 1'b0;//和flag_encode_B_row_over信号是反相关系
            end

            /////////////////////算数矩阵B,计算矩阵B的行校验和,相关控制信号：generate_enable,fetch_B,reg_fetch_B_ready,reg_dataBr_out_ready，flag_encode_B_row_over////////////////////////////////////////////
            //存储器memBr未生成完成
            if(fetch_B&&!O_fetch_B_ready&&flag_encode_B_row_over&&!flag_memBr_over) begin//flag_memBr_over=0,处于编码矩阵B的状态，需要编码,count_for_Br肯定等于6'd0
                
                if(count_for_row_of_Br_accumulation == 6'd0) begin //这里的算数落后前面取数一个时钟周期
                    add_result <= I_dataBr_in[count_for_row_of_Br_accumulation];
                    accumulation_result <= 32'd0;
                    count_for_row_of_Br_accumulation <= count_for_row_of_Br_accumulation + 1'b1;
                end

                if((count_for_row_of_Br_accumulation > 6'd0) && (count_for_row_of_Br_accumulation < 6'd32)) begin
                    add_result <= I_dataBr_in[count_for_row_of_Br_accumulation] + accumulation_result;
                    accumulation_result <= add_result;
                    count_for_row_of_Br_accumulation <= count_for_row_of_Br_accumulation + 1'b1;
                end
                
                if(count_for_row_of_Br_accumulation == 6'd32) begin
                    add_result <= 32'd0;
                    accumulation_result <= 32'd0;
                    memBr[count_for_Br_row-1] <= add_result + accumulation_result;
                    flag_encode_B_row_over <= 1'b0;
                    O_dataBr_out_ready <= 1'b1; //值为1，正确释放Br对应行数据
                    flag_memBr_over <= (count_for_Br_row == 6'd32) ? 1'b1 : 1'b0;
                    O_fetch_B_ready <= (count_for_Br_row == 6'd32) ? 1'b1 : 1'b0;
                    //对dataBr_out_ready信号进行高电平延长时间的逻辑
                    flag_control_dataBr_out_ready <= 1'b1;
                end
            end
            //存储器memBr生成完成，通过flag_memBr_over这个标志来区分
            //flag_memBr_over拉高后，不再进行矩阵B编码相关行的操作，所以编码矩阵B相关行的操作只在detect_correct信号由00变为01时将flag_memBr_over信号置零产生
            if(fetch_B&&!O_fetch_B_ready&&flag_encode_B_row_over&&flag_memBr_over) begin //flag_memBr_over = 1'b1,矩阵B的编码状态已经完成
                flag_encode_B_row_over <= 1'b0;//即使矩阵B编码完成，也通过flag_encode_B_row_over这个变量来空转编码过程，和之前那个过程保持一致
                O_dataBr_out_ready <= 1'b1;
                O_fetch_B_ready <= (count_for_Br_row == 6'd32) ? 1'b1 : 1'b0;
                flag_control_dataBr_out_ready <= 1'b1;//表示延长dataBr_out_ready信号的拉高时间
            end
            //取数逻辑的输出：flag_encode_B_row_over = 1 表示后面进行算数行为
            //算数逻辑的输出: flag_encode_B_row_over = 0 表示后面进行取数行为,在取数always块中拉低O_dataBr_out_ready信号，更新I_dataBr_in的值，同时也更新dataBr_out的值
            if(flag_control_dataBr_out_ready) begin
                if(count_for_hold_dataBr_out_ready < 2'b11) begin
                    count_for_hold_dataBr_out_ready <= count_for_hold_dataBr_out_ready + 1'b1;
                end else begin
                    count_for_hold_dataBr_out_ready <= 2'b00;
                    flag_control_dataBr_out_ready <= 1'b0;
                    if(count_for_Br_row == 6'd32) begin
                        O_dataBr_out_ready <= 1'b0;
                        flag_add_rising_edge_of_dataBr_out_ready <= 1'b1;
                    end
                end
            end
            //人为制造两个dataBr_out_ready上升沿
            if(flag_add_rising_edge_of_dataBr_out_ready) begin
                if(count_for_add_rising_edge_of_dataBr_out_ready == 6'd7) begin
                    O_dataBr_out_ready <= 1'b1;
                    count_for_add_rising_edge_of_dataBr_out_ready <= count_for_add_rising_edge_of_dataBr_out_ready + 1'b1;
                end else if(count_for_add_rising_edge_of_dataBr_out_ready == 6'd11) begin
                    O_dataBr_out_ready <= 1'b0;
                    count_for_add_rising_edge_of_dataBr_out_ready <= count_for_add_rising_edge_of_dataBr_out_ready + 1'b1;
                end else if(count_for_add_rising_edge_of_dataBr_out_ready == 6'd18) begin
                    O_dataBr_out_ready <= 1'b1;
                    count_for_add_rising_edge_of_dataBr_out_ready <= count_for_add_rising_edge_of_dataBr_out_ready + 1'b1;
                end else if(count_for_add_rising_edge_of_dataBr_out_ready == 6'd22) begin
                    O_dataBr_out_ready <= 1'b0;
                    count_for_add_rising_edge_of_dataBr_out_ready <= 6'd0;
                    flag_add_rising_edge_of_dataBr_out_ready <= 1'b0;
                end else begin
                    count_for_add_rising_edge_of_dataBr_out_ready <= count_for_add_rising_edge_of_dataBr_out_ready+1'b1;
                end
            end
        end
    end
    
    //////////////////将内部寄存器型变量或线网型变量与输出端口连接////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////输出的数据端口//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //使用已经设计好的IP模块mux32，相当于Baseline加速器里面组合逻辑取数的功能
    mux32 u_mux32_1 (
        .mux_sel         (mux_sel[4:0]),
        .mux_data_in     ({I_dataAc_in[31],I_dataAc_in[30],I_dataAc_in[29],I_dataAc_in[28],I_dataAc_in[27],I_dataAc_in[26],I_dataAc_in[25],I_dataAc_in[24],
                           I_dataAc_in[23],I_dataAc_in[22],I_dataAc_in[21],I_dataAc_in[20],I_dataAc_in[19],I_dataAc_in[18],I_dataAc_in[17],I_dataAc_in[16],
                           I_dataAc_in[15],I_dataAc_in[14],I_dataAc_in[13],I_dataAc_in[12],I_dataAc_in[11],I_dataAc_in[10],I_dataAc_in[9],I_dataAc_in[8],
                           I_dataAc_in[7],I_dataAc_in[6],I_dataAc_in[5],I_dataAc_in[4],I_dataAc_in[3],I_dataAc_in[2],I_dataAc_in[1],I_dataAc_in[0]}),
        .mux_data_out    (wire_dataAc_out[0])
    );

    mux32 u_mux32_2 (
        .mux_sel         (mux_sel[4:0]),
        .mux_data_in     ({memAc[31],memAc[30],memAc[29],memAc[28],memAc[27],memAc[26],memAc[25],memAc[24],
                           memAc[23],memAc[22],memAc[21],memAc[20],memAc[19],memAc[18],memAc[17],memAc[16],
                           memAc[15],memAc[14],memAc[13],memAc[12],memAc[11],memAc[10],memAc[9],memAc[8],
                           memAc[7],memAc[6],memAc[5],memAc[4],memAc[3],memAc[2],memAc[1],memAc[0]}),
        .mux_data_out    (wire_dataAc_out[1])
    );

    assign  dataAc_out = (count_for_Ac_row == 6'd33) ? wire_dataAc_out[1] : wire_dataAc_out[0]; //count_for_Ac_row初值为0，每取矩阵A的一行，值增加1
    //下面给出了矩阵B的数据输出端口的连续赋值语句赋值
    genvar j;
    generate for (j = 0;j < 33 ;j = j + 1 ) begin : gen_dataBr_out
        if(j!=32) begin //j的取值为 0，1，2，3，~~，32这33个离散的量
            assign dataBr_out[32*j+:32] = I_dataBr_in[j]; //这里j只能取0到31
        end else  begin
            assign dataBr_out[32*j+:32] = memBr[count_for_Br_row-1];
        end
    end
    endgenerate
    ////////输出的控制端口/////////////////////////////////////////////////////////
    assign dataBr_out_ready = O_dataBr_out_ready,
           fetch_A_ready = O_fetch_A_ready,
           fetch_B_ready = O_fetch_B_ready;
    assign full[2:0] = O_full[2:0];
    
endmodule
