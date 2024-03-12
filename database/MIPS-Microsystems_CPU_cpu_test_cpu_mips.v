module mips(clk_in,sys_rstn,uart_rxd,dip_switch7,dip_switch6,dip_switch5,dip_switch4,dip_switch3,dip_switch2,dip_switch1,dip_switch0,user_key,uart_txd,led_light,digital_tube0,digital_tube1,digital_tube2,digital_tube_sel0,digital_tube_sel1,digital_tube_sel2,PC,t3);
//input
    input clk_in;
    input sys_rstn;

    input uart_rxd;

    input [7:0] dip_switch7;
    input [7:0] dip_switch6;
    input [7:0] dip_switch5;
    input [7:0] dip_switch4;
    input [7:0] dip_switch3;
    input [7:0] dip_switch2;
    input [7:0] dip_switch1;
    input [7:0] dip_switch0;

    input [7:0] user_key;

//output
    output uart_txd;

    output [31:0] led_light;

    output [7:0] digital_tube0;
    output [7:0] digital_tube1;
    output [7:0] digital_tube2;
    output [3:0] digital_tube_sel0;
    output [3:0] digital_tube_sel1;
    output digital_tube_sel2;

    output [31:0] PC;
    output [31:0] t3;

//----------signals----------//
//intern signals
    wire CPU_We;
    wire [31:0] CPU_ADDR,CPU_WD;

//extern signals
    wire IRQ_Timer,IRQ_UART,IRQ_Switch,IRQ_Key;
    wire [15:10] Pr_IP;            //Pr means periphreral

    wire [31:0] Pr_ADDR;
    wire [31:0] Timer_RD,UART_RD,Switch_RD,LED_RD,Tube_RD,Key_RD;
    wire [31:0] Pr_RD;

    wire [4:2] UART_ADDR;

    wire PrWe;
    wire [31:0] CS;
    wire [31:0] Pr_WD;

//control signals
    wire reset;
    
    assign reset=~sys_rstn;     //reset is valid when at low level

//----------sub_modules----------//
//CLK

	IP_clk clk_transfer(
		.CLK_IN1(clk_in),      // IN
		.CLK_OUT1(clk),    		//for mips
		.CLK_OUT2(clk_ip)		//for IP core
	);

//CPU

    CPU cpu(
        .clk(clk),.reset(reset),.clk_ip(clk_ip),
        .Pr_IP(Pr_IP),.Pr_RD(Pr_RD),
        .CPU_We(CPU_We),
        .CPU_ADDR(CPU_ADDR),
        .CPU_WD(CPU_WD),.CPU_PC(PC),
        .t3(t3)
    );

//Bridge

    Bridge bridge(
        .We(CPU_We),
        .IRQ_Timer(IRQ_Timer),.IRQ_UART(IRQ_UART),.IRQ_Switch(IRQ_Switch),.IRQ_Key(IRQ_Key),
        .ADDR(CPU_ADDR),.WD(CPU_WD),
        .Timer_RD(Timer_RD),.UART_RD(UART_RD),.Switch_RD(Switch_RD),.LED_RD(LED_RD),.Tube_RD(Tube_RD),.Key_RD(Key_RD),
        .Pr_IP(Pr_IP),.Pr_RD(Pr_RD),
        .PrWe(PrWe),.CS(CS),
        .Pr_ADDR(Pr_ADDR),.Pr_WD(Pr_WD),
        .UART_ADDR(UART_ADDR)
    );

//Timer 0

    Timer timer(
         .clk(clk),.reset(reset),
         .TimerWe((CS==0)&&PrWe),
         .ADDR(Pr_ADDR),.Din(Pr_WD),
         .Dout(Timer_RD),.IRQ(IRQ_Timer)
    );

//UART 1

    MiniUART miniuart(
        .CLK_I(clk),.RST_I(reset),
        .STB_I((CS==1)),.WE_I(PrWe),
        .ADD_I(UART_ADDR),.DAT_I(Pr_WD),
        .RxD(uart_rxd),
        .DAT_O(UART_RD),
        .ACK_O(),
        .IRQ(IRQ_UART),
        .TxD(uart_txd)
    );

//Switch 2

    Switch switch(
        .clk(clk),.reset(reset),
        .ADDR(Pr_ADDR),.Switch_WD({dip_switch7,dip_switch6,dip_switch5,dip_switch4,dip_switch3,dip_switch2,dip_switch1,dip_switch0}),
        .IRQ(IRQ_Switch),
        .Switch_RD(Switch_RD)
    );

//LED 3

    LED led(
        .clk(clk),.reset(reset),
        .LEDWe((CS==3)&&PrWe),
        .LED_WD(Pr_WD),
        .LED_RD(LED_RD),.lights(led_light)
    );

//Tube 4

    Tube tube(
        .clk(clk),.reset(reset),
        .We((CS==4)&&PrWe),
        .ADDR(Pr_ADDR),.Tube_WD(Pr_WD),
        .digital_tube0(digital_tube0),.digital_tube1(digital_tube1),.digital_tube2(digital_tube2),
        .digital_Sel0(digital_tube_sel0),.digital_Sel1(digital_tube_sel1),.digital_Sel2(digital_tube_sel2),
        .Tube_RD(Tube_RD)
    );

//Key 5

    Key key(
        .clk(clk),.reset(reset),
        .key(user_key),
        .IRQ(IRQ_Key),
        .Key_RD(Key_RD)
    );

endmodule
