module Bridge(We,IRQ_Timer,IRQ_UART,IRQ_Switch,IRQ_Key,ADDR,WD,Timer_RD,UART_RD,Switch_RD,LED_RD,Tube_RD,Key_RD,Pr_IP,Pr_RD,PrWe,CS,Pr_ADDR,Pr_WD,UART_ADDR);
//input
    input We;                //whether to write peripheral devices
    input IRQ_Timer;         //peripheral devices' interrupt signal
    input IRQ_UART;
    input IRQ_Switch;
    input IRQ_Key;
    
    input [31:0] ADDR;
    input [31:0] WD;

    input [31:0] Timer_RD;
    input [31:0] UART_RD;
    input [31:0] Switch_RD;
    input [31:0] LED_RD;
    input [31:0] Tube_RD;
    input [31:0] Key_RD;

//output
//intern
    output [15:10] Pr_IP;
    output reg [31:0] Pr_RD;
//extern
    output PrWe; 
    output reg [31:0] CS;

    output [31:0] Pr_ADDR;
    output [31:0] Pr_WD;

    output [4:2] UART_ADDR;

//combinational logic
    parameter Timer=0,
              UART=1,
              Switch=2,
              LED=3,
              Tube=4,
              Key=5;

    assign Pr_IP={2'b0,IRQ_Key,IRQ_Switch,IRQ_UART,IRQ_Timer};

    assign PrWe=We;
    assign Pr_ADDR=ADDR;
    assign Pr_WD=WD;

    assign UART_ADDR=(ADDR-32'h0000_7f10)>>2;

    always @(*)
        begin
            if(ADDR>=32'h0000_7F00&&ADDR<=32'h0000_7F0B)
                begin
                    CS=Timer;
                    Pr_RD=Timer_RD;
                end
            else if(ADDR>=32'h0000_7F10&&ADDR<=32'h0000_7F2B)
                begin
                    CS=UART;
                    Pr_RD=UART_RD;
                end
            else if(ADDR>=32'h0000_7F2C&&ADDR<=32'h0000_7F33)
                begin
                    CS=Switch;
                    Pr_RD=Switch_RD;
                end
            else if(ADDR>=32'h0000_7F34&&ADDR<=32'h0000_7F37)
                begin
                    CS=LED;
                    Pr_RD=LED_RD;
                end
            else if(ADDR>=32'h0000_7F38&&ADDR<=32'h0000_7F3F)
                begin
                    CS=Tube;
                    Pr_RD=Tube_RD;
                end
            else if(ADDR>=32'h0000_7F40&&ADDR<=32'h0000_7F43)
                begin
                    CS=Key;
                    Pr_RD=Key_RD;
                end
            else
                begin
                    CS=-1;
                    Pr_RD=-1;
                end
        end

endmodule