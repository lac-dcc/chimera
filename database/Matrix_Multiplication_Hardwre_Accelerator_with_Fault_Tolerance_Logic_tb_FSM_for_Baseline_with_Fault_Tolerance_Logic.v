// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale  1ns / 1ps

 module tb_FSM_for_Baseline_with_Fault_Tolerance_Logic;
//通过分析自动售货机TestBench写法和它的仿真波形图：可以总结结如下：�?�择�?些典型的状�?�转移路径仿真验证正确�?�，如果是四个独立的场景，前�?个场景结束和后一个场景开始需要间隔一些时钟周期，�?要在TestBench中认为编写一些语句控�?
//仿真波形信号只需选取�?重要的一些信号看即可，一些计数变量或是配置变量可以从波形图中删去
// FSM_for_Baseline_with_Fault_Tolerance_Logic Parameters
parameter   PERIOD = 10,
            IDLE = 10'b00000_00001,
            Buffer_row_A = 10'b00000_00010,
            Multiply_accumulate = 10'b00000_00100,
            Write_row_C =10'b00000_01000,
            Buffer_row_A_Correct1 = 10'b00000_10000,
            Multiply_Accumulate_Correct1 = 10'b00001_00000,
            Write_row_C_Correct1 = 10'b00010_00000,
            Buffer_row_Correct2 = 10'b00100_00000,
            Multiply_Accumulate_Correct2 = 10'b01000_00000,
            Write_row_C_Correct2 = 10'b10000_00000;

// FSM_for_Baseline_with_Fault_Tolerance_Logic Inputs

reg   clk                                  =0;
reg   rst_n                                ;
//来自TestBench
reg   start                                ;
reg   store_C_ready                        ;
//来自MACs
reg   MACs_ready                           ;
//来自校验和产生模块
reg   fetch_A_ready                        ;
reg   fetch_B_ready                        ;
reg   [2:0]  full                          ;
//来自循环移位器模块
reg   shift_ready                          ;
//来自校验和验证模块
reg   error                                ;
reg   [32:0] column_indicator              ;
reg   column_verify_ready                  ;
// FSM_for_Baseline_with_Fault_Tolerance_Logic Outputs

//校验和产生模块
wire  [1:0] detect_correct                 ;
wire  generate_enable                      ,
      fetch_A                              ,
      fetch_B                              ;
//循环移位器模块
wire  [5:0] step_size                      ;
wire  shift_enable                         ,
      shift_direction                      ,
      direct_connection                    ;
//校验和验证模块
wire  verify_enable                        ;
//MACs模块
wire  MACs_enable                          ;
//给到TestBench
wire  store_C                              ,
      finish                               ;



initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    rst_n  =  0;
    #8 
    rst_n  =  1;
end
//VScode自动生成TestBench,下面传参数太高明了,这个没有什么用，一开始进入IDLE状态是rst_n信号拉低所致
FSM_for_Baseline_with_Fault_Tolerance_Logic #(
    .IDLE ( IDLE )) 
 u_FSM_for_Baseline_with_Fault_Tolerance_Logic (
    //input ports
    .clk                     ( clk                    ),
    .rst_n                   ( rst_n                  ),
    .start                   ( start                  ),
    .store_C_ready           ( store_C_ready          ),
    .MACs_ready              ( MACs_ready             ),
    .fetch_A_ready           ( fetch_A_ready          ),
    .fetch_B_ready           ( fetch_B_ready          ),
    .full                    ( full[2:0]              ),
    .shift_ready             ( shift_ready            ),
    .error                   ( error                  ),
    .column_indicator        ( column_indicator[32:0] ),
    .column_verify_ready     ( column_verify_ready    ),
    //output ports
    .detect_correct          ( detect_correct[1:0]    ),
    .generate_enable         ( generate_enable        ),
    .fetch_A                 ( fetch_A                ),
    .fetch_B                 ( fetch_B                ),
    .step_size               ( step_size[5:0]         ),
    .shift_enable            ( shift_enable           ),
    .shift_direction         ( shift_direction        ),
    .direct_connection       ( direct_connection      ),
    .verify_enable           ( verify_enable          ),
    .MACs_enable             ( MACs_enable            ),
    .store_C                 ( store_C                ),
    .finish                  ( finish                 )
);

//为了方便在仿真波形图中查看，使用字符串描述状�?
reg [223:0] state_name;
always@(*)
    begin
        case(u_FSM_for_Baseline_with_Fault_Tolerance_Logic.state)
            IDLE:
                state_name = "IDLE";
            Buffer_row_A:
                state_name = "Buffer_row_A";
            Multiply_accumulate:
                state_name = "Multiply_Accumulate";
            Write_row_C:
                state_name = "Write_row_C";
            Buffer_row_A_Correct1:
                state_name = "Buffer_row_A_Correct1";
            Multiply_Accumulate_Correct1:
                state_name = "Multiply_Accumulate_Correct1";
            Write_row_C_Correct1:
                state_name = "Write_row_C_Correct1";
            Buffer_row_Correct2:
                state_name = "Buffer_row_Correct2";
            Multiply_Accumulate_Correct2:
                state_name = "Multiply_Accumulate_Correct2";
            Write_row_C_Correct2:
                state_name = "Write_row_C_Correct2";
            default :
            state_name = "IDLE";
        endcase
    end

//下面是仿真开始时，状态机输入信号初始值的集合
initial begin
    //来自BRAM控制器的信号，暂且来自TestBench
    start = 0;
    store_C_ready = 0;
    //来自MACs
    MACs_ready = 0;
    //来自校验和产生模块
    fetch_A_ready = 0;
    fetch_B_ready = 0;
    full = 3'd0;
    //来循环移位器模块
    shift_ready = 0;
    //来自校验和验证模块
    error = 0;
    column_indicator = 33'd0;//这个信号在状态机模块也没有使用到
    column_verify_ready = 0;//这个信号在状态机模块没有使用到
end
 //生成一个二维向量数组，存储每次repeat语句中各输入信号要的输入信号值，[0:11]是行号，表示状态机有12个需要控制的输入，[0:3]是列号，表示待验证四条路径
 //向量位宽为[0:4]表示每次都是按照IDLE->Buffer_row_A->Multiply_Accumulate->Write_row_C->IDLE这样一个路径循环,给了这么大一个存储空间（存储深度）,每个输入变量在状态跳转时都有一个值，此外加上一个时钟周期的路径间间隔，位宽为5
 reg [0:4] FSM_Input_value [0:7][0:3];//对于位宽为1的输入控制信号
 reg [32:0] FSM_column_indicator [0:3][0:4];//[0:3]代表路径条数，[0:4]代表每条路径值变化次数为5
 reg [2:0] FSM_full [0:3][0:4];
 integer i,j,k;

initial begin //这里是输入信号值的存储
    //第一条：IDLE->Buffer_row_A->Multiply_Accumulate->Write_row_C       3个值应对跳转有效
    //第二条：Write_Row_C->Buffer_row_A_Correct1->Multiply_Accumulate_Correct1->Write_Row_C_Correct1       3个值应对跳转有效
    //第三条: Write_Row_C_Correct1->Buffer_row_A_Correct1->Multiply_Accumulate_Correct1->Write_Row_C_Correct1      3个值应对跳转有效
    //第四条：Write_Row_C_Correct1->Buffer_row_A_Correct2->Multiply_Accumulate_Correct2->Write_Row_C_Correct2->IDLE      4个值应对跳转有效
    //下面时对start信号的待投送配置，1代表有效0代表无效，也可表示多路径间多余的周期，后面信号也按照这样的规划
    //signal start configuration
           FSM_Input_value[0][0] = 5'b10000; 
           FSM_Input_value[0][1] = 5'b00000; 
           FSM_Input_value[0][2] = 5'b00000; 
           FSM_Input_value[0][3] = 5'b00000; 
    //signal store_C_ready configuration
           FSM_Input_value[1][0] = 5'b00000; 
           FSM_Input_value[1][1] = 5'b10000; 
           FSM_Input_value[1][2] = 5'b10000; 
           FSM_Input_value[1][3] = 5'b10010; 
    //signal MACs_ready configuration
           FSM_Input_value[2][0] = 5'b00100;
           FSM_Input_value[2][1] = 5'b00100;
           FSM_Input_value[2][2] = 5'b00100;
           FSM_Input_value[2][3] = 5'b00100;
    //signal fetch_A_ready configuration
           FSM_Input_value[3][0] = 5'b01000;
           FSM_Input_value[3][1] = 5'b01000;
           FSM_Input_value[3][2] = 5'b01000;
           FSM_Input_value[3][3] = 5'b01000;
    //signal fetch_B_ready configuration
           FSM_Input_value[4][0] = 5'b00100;
           FSM_Input_value[4][1] = 5'b00100;
           FSM_Input_value[4][2] = 5'b00100;
           FSM_Input_value[4][3] = 5'b00100;
    //signal shift_ready configuration //与MACs_ready信号保持一致
           FSM_Input_value[5][0] = 5'b00100;
           FSM_Input_value[5][1] = 5'b00100;
           FSM_Input_value[5][2] = 5'b00100;
           FSM_Input_value[5][3] = 5'b00100;
    //signal error configuration
           FSM_Input_value[6][0] = 5'b00000;
           FSM_Input_value[6][1] = 5'b10000;
           FSM_Input_value[6][2] = 5'b00000;
           FSM_Input_value[6][3] = 5'b00000;
    //signal column_verify_ready configuration //这个信号和error信号本质上是一个信号，目前随便赋值，不用管太多
           FSM_Input_value[7][0] = 5'b00000;
           FSM_Input_value[7][1] = 5'b10000;
           FSM_Input_value[7][2] = 5'b00000;
           FSM_Input_value[7][3] = 5'b00000;
    ////////////full[2:0] configuration//////////////
    //signal full[0] configuration
           for(i = 0; i < 4; i = i + 1) begin
                for(j = 0; j < 5; j = j + 1) begin
                    if((i==1)&&(j==0)) begin
                        FSM_full[i][j] = 3'd1;
                    end else if((i==3)&&(j==0)) begin
                        FSM_full[i][j] = 3'd2;
                    end else if((i==3)&&(j==3)) begin
                        FSM_full[i][j] = 3'd4;
                    end else begin
                        FSM_full[i][j] = 3'd0;
                    end
                end
           end
    //////////column_indicator[32:0] configuration
           for(i = 0; i < 4; i = i + 1) begin
                for (j = 0;j < 5 ;j = j + 1 ) begin
                    if(i == j) begin
                        FSM_column_indicator[i][j] = 33'd1;//基本功不扎实很难弄
                    end else begin
                        FSM_column_indicator[i][j] = 33'd0;
                    end
                end
           end
   //依据波形排查上面的配置
    # 16 
    //第一条：IDLE->Buffer_row_A->Multiply_Accumulate->Write_row_C

    k = 0;
    repeat(5)begin
       @(negedge clk);
                //对位宽为1的输入信号的处理
                start = FSM_Input_value[0][0][0];
                store_C_ready = FSM_Input_value[1][0][0];
                MACs_ready = FSM_Input_value[2][0][0];
                fetch_A_ready = FSM_Input_value[3][0][0];
                fetch_B_ready = FSM_Input_value[4][0][0];
                shift_ready = FSM_Input_value[5][0][0];
                error = FSM_Input_value[6][0][0];
                column_verify_ready = FSM_Input_value[7][0][0];

                FSM_Input_value[0][0] = FSM_Input_value[0][0] << 1;
                FSM_Input_value[1][0] = FSM_Input_value[1][0] << 1;
                FSM_Input_value[2][0] = FSM_Input_value[2][0] << 1;
                FSM_Input_value[3][0] = FSM_Input_value[3][0] << 1;
                FSM_Input_value[4][0] = FSM_Input_value[4][0] << 1;
                FSM_Input_value[5][0] = FSM_Input_value[5][0] << 1;
                FSM_Input_value[6][0] = FSM_Input_value[6][0] << 1;
                FSM_Input_value[7][0] = FSM_Input_value[7][0] << 1;
                //对位宽不为1的输入信号的处理
                full = FSM_full[0][k];
                column_indicator = FSM_column_indicator[0][k];
                k = k + 1;
    end


    //第二条：Write_Row_C->Buffer_row_A_Correct1->Multiply_Accumulate_Correct1->Write_Row_C_Correct1
    k = 0;
    repeat(5)begin
        @(negedge clk);
            //对位宽为1的输入信号的处理
            start = FSM_Input_value[0][1][0];
            store_C_ready = FSM_Input_value[1][1][0];
            MACs_ready = FSM_Input_value[2][1][0];
            fetch_A_ready = FSM_Input_value[3][1][0];
            fetch_B_ready = FSM_Input_value[4][1][0];
            shift_ready = FSM_Input_value[5][1][0];
            error = FSM_Input_value[6][1][0];
            column_verify_ready = FSM_Input_value[7][1][0];

            FSM_Input_value[0][1] = FSM_Input_value[0][1] << 1;
            FSM_Input_value[1][1] = FSM_Input_value[1][1] << 1;
            FSM_Input_value[2][1] = FSM_Input_value[2][1] << 1;
            FSM_Input_value[3][1] = FSM_Input_value[3][1] << 1;
            FSM_Input_value[4][1] = FSM_Input_value[4][1] << 1;
            FSM_Input_value[5][1] = FSM_Input_value[5][1] << 1;
            FSM_Input_value[6][1] = FSM_Input_value[6][1] << 1;
            FSM_Input_value[7][1] = FSM_Input_value[7][1] << 1;
            //对位宽不为1的输入信号的处理
            full = FSM_full[1][k];
            column_indicator = FSM_column_indicator[1][k];
            k = k + 1;
    end
    //第三条: Write_Row_C_Correct1->Buffer_row_A_Correct1->Multiply_Accumulate_Correct1->Write_Row_C_Correct1
    k = 0;
    repeat(5)begin
        @(negedge clk);
            //对位宽为1的输入信号的处理
            start = FSM_Input_value[0][2][0];
            store_C_ready = FSM_Input_value[1][2][0];
            MACs_ready = FSM_Input_value[2][2][0];
            fetch_A_ready = FSM_Input_value[3][2][0];
            fetch_B_ready = FSM_Input_value[4][2][0];
            shift_ready = FSM_Input_value[5][2][0];
            error = FSM_Input_value[6][2][0];
            column_verify_ready = FSM_Input_value[7][2][0];

            FSM_Input_value[0][2] = FSM_Input_value[0][2] << 1;
            FSM_Input_value[1][2] = FSM_Input_value[1][2] << 1;
            FSM_Input_value[2][2] = FSM_Input_value[2][2] << 1;
            FSM_Input_value[3][2] = FSM_Input_value[3][2] << 1;
            FSM_Input_value[4][2] = FSM_Input_value[4][2] << 1;
            FSM_Input_value[5][2] = FSM_Input_value[5][2] << 1;
            FSM_Input_value[6][2] = FSM_Input_value[6][2] << 1;
            FSM_Input_value[7][2] = FSM_Input_value[7][2] << 1;
            //对位宽不为1的输入信号的处理
            full = FSM_full[2][k];
            column_indicator = FSM_column_indicator[2][k];
            k = k + 1;
    end
    //第四条：Write_Row_C_Correct1->Buffer_row_A_Correct2->Multiply_Accumulate_Correct2->Write_Row_C_Correct2->IDLE
    k = 0;
    repeat(5)begin
        @(negedge clk);
            //对位宽为1的输入信号的处理
            start = FSM_Input_value[0][3][0];
            store_C_ready = FSM_Input_value[1][3][0];
            MACs_ready = FSM_Input_value[2][3][0];
            fetch_A_ready = FSM_Input_value[3][3][0];
            fetch_B_ready = FSM_Input_value[4][3][0];
            shift_ready = FSM_Input_value[5][3][0];
            error = FSM_Input_value[6][3][0];
            column_verify_ready = FSM_Input_value[7][3][0];

            FSM_Input_value[0][3] = FSM_Input_value[0][3] << 1;
            FSM_Input_value[1][3] = FSM_Input_value[1][3] << 1;
            FSM_Input_value[2][3] = FSM_Input_value[2][3] << 1;
            FSM_Input_value[3][3] = FSM_Input_value[3][3] << 1;
            FSM_Input_value[4][3] = FSM_Input_value[4][3] << 1;
            FSM_Input_value[5][3] = FSM_Input_value[5][3] << 1;
            FSM_Input_value[6][3] = FSM_Input_value[6][3] << 1;
            FSM_Input_value[7][3] = FSM_Input_value[7][3] << 1;
            //对位宽不为1的输入信号的处理
            full = FSM_full[3][k];
            column_indicator = FSM_column_indicator[3][k];
            k = k + 1;
    end
end

initial
begin
    #220
    $finish;
end

endmodule
