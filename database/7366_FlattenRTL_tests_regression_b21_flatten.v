// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module b21 #(
        parameter P1__FETCH=0,
        parameter P1__EXEC=1,
        parameter P2__FETCH=0,
        parameter P2__EXEC=1) (
            input clock,
            input reset,
            input [31:0] si,
            output reg  [19:0] so,
            output reg  rd,
            output reg  wr) ;
    wire [19:0] ad1 ;
    wire [19:0] ad2 ;
    integer di1 ;
    integer di2 ;
    wire [31:0] do1 ;
    wire [31:0] do2 ;
    wire r1 ;
    wire r2 ;
    wire w1 ;
    wire w2 ;

    wire  P1__clock;
    wire  P1__reset;
    reg [19:0] P1__addr;
    wire [31:0] P1__datai;
    integer P1__datao;
    reg  P1__rd;
    reg  P1__wr;

    always @(  posedge    P1__clock          or  posedge   P1__reset  )
    begin :  P1__xhdl0
        integer  P1__reg0  ;
        integer  P1__reg1  ;
        integer  P1__reg2  ;
        integer  P1__reg3  ;
        reg  P1__B  ;
        reg[19:0]  P1__MAR  ;
        integer  P1__MBR  ;
        reg[1:0]  P1__mf  ;
        reg[2:0]  P1__df  ;
        reg[0:0]  P1__cf  ;
        reg[3:0]  P1__ff  ;
        reg[19:0]  P1__tail  ;
        integer  P1__IR  ;
        reg[0:0]  P1__state  ;
        integer  P1__r  ;
        integer  P1__m  ;
        integer  P1__t  ;
        integer  P1__d  ;
        integer  P1__temp  ;
        reg[1:0]  P1__s  ;
        if (  P1__reset  ==1'b1)
        begin
            P1__MAR   =0;
            P1__MBR   =0;
            P1__IR   =0;
            P1__d   =0;
            P1__r   =0;
            P1__m   =0;
            P1__s   =0;
            P1__temp   =0;
            P1__mf   =0;
            P1__df   =0;
            P1__ff   =0;
            P1__cf   =0;
            P1__tail   =0;
            P1__B   =1'b0;
            P1__reg0   =0;
            P1__reg1   =0;
            P1__reg2   =0;
            P1__reg3   =0;
            P1__addr   <=0;
            P1__rd   <=1'b0;
            P1__wr   <=1'b0;
            P1__datao   <=0;
            P1__state   =  P1__FETCH  ;
        end
        else
        begin
            P1__rd   <=1'b0;
            P1__wr   <=1'b0;
            case (  P1__state  )
                P1__FETCH   :
                begin
                    P1__MAR   =  P1__reg3  %2**20;
                    P1__addr   <=  P1__MAR  ;
                    P1__rd   <=1'b1;
                    P1__MBR   =  P1__datai  ;
                    P1__IR   =  P1__MBR  ;
                    P1__state   =  P1__EXEC  ;
                end
                P1__EXEC   :
                begin
                    if (  P1__IR  <0)
                        P1__IR   =-  P1__IR  ;
                    P1__mf   =(  P1__IR  /2**27)%4;
                    P1__df   =(  P1__IR  /2**24)%2**3;
                    P1__ff   =(  P1__IR  /2**19)%2**4;
                    P1__cf   =(  P1__IR  /2**23)%2;
                    P1__tail   =  P1__IR  %2**20;
                    P1__reg3   =((  P1__reg3  %2**29)+8);
                    P1__s   =(  P1__IR  /2**29)%4;
                    case (  P1__s  )
                        0 :
                            P1__r   =  P1__reg0  ;
                        1 :
                            P1__r   =  P1__reg1  ;
                        2 :
                            P1__r   =  P1__reg2  ;
                        3 :
                            P1__r   =  P1__reg3  ;
                    endcase
                    case (  P1__cf  )
                        1 :
                        begin
                            case (  P1__mf  )
                                0 :
                                    P1__m   =  P1__tail  ;
                                1 :
                                begin
                                    P1__m   =  P1__datai  ;
                                    P1__addr   <=  P1__tail  ;
                                    P1__rd   <=1'b1;
                                end
                                2 :
                                begin
                                    P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                    P1__rd   <=1'b1;
                                    P1__m   =  P1__datai  ;
                                end
                                3 :
                                begin
                                    P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                    P1__rd   <=1'b1;
                                    P1__m   =  P1__datai  ;
                                end
                            endcase
                            case (  P1__ff  )
                                0 :
                                    if (  P1__r  <  P1__m  )
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                1 :
                                    if (~(  P1__r  <  P1__m  ))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                2 :
                                    if (  P1__r  ==  P1__m  )
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                3 :
                                    if (~(  P1__r  ==  P1__m  ))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                4 :
                                    if (~(  P1__r  >  P1__m  ))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                5 :
                                    if (  P1__r  >  P1__m  )
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                6 :
                                begin
                                    if (  P1__r  >2**30-1)
                                        P1__r   =  P1__r  -2**30;
                                    if (  P1__r  <  P1__m  )
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                end
                                7 :
                                begin
                                    if (  P1__r  >2**30-1)
                                        P1__r   =  P1__r  -2**30;
                                    if (~(  P1__r  <  P1__m  ))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                end
                                8 :
                                    if ((  P1__r  <  P1__m  )|(  P1__B  ==1'b1))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                9 :
                                    if ((~(  P1__r  <  P1__m  ))|(  P1__B  ==1'b1))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                10 :
                                    if ((  P1__r  ==  P1__m  )|(  P1__B  ==1'b1))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                11 :
                                    if ((~(  P1__r  ==  P1__m  ))|(  P1__B  ==1'b1))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                12 :
                                    if ((~(  P1__r  >  P1__m  ))|(  P1__B  ==1'b1))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                13 :
                                    if ((  P1__r  >  P1__m  )|(  P1__B  ==1'b1))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                14 :
                                begin
                                    if (  P1__r  >2**30-1)
                                        P1__r   =  P1__r  -2**30;
                                    if ((  P1__r  <  P1__m  )|(  P1__B  ==1'b1))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                end
                                15 :
                                begin
                                    if (  P1__r  >2**30-1)
                                        P1__r   =  P1__r  -2**30;
                                    if ((~(  P1__r  <  P1__m  ))|(  P1__B  ==1'b1))
                                        P1__B   =1'b1;
                                    else
                                        P1__B   =1'b0;
                                end
                            endcase
                        end
                        0 :
                            if (~(  P1__df  ==7))
                            begin
                                if (  P1__df  ==5)
                                begin
                                    if ((~(  P1__B  ))==1'b1)
                                        P1__d   =3;
                                end
                                else
                                    if (  P1__df  ==4)
                                    begin
                                        if (  P1__B  ==1'b1)
                                            P1__d   =3;
                                    end
                                    else
                                        if (  P1__df  ==3)
                                            P1__d   =3;
                                        else
                                            if (  P1__df  ==2)
                                                P1__d   =2;
                                            else
                                                if (  P1__df  ==1)
                                                    P1__d   =1;
                                                else
                                                    if (  P1__df  ==0)
                                                        P1__d   =0;
                                case (  P1__ff  )
                                    0 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        P1__t   =0;
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =  P1__t  -  P1__m  ;
                                            1 :
                                                P1__reg1   =  P1__t  -  P1__m  ;
                                            2 :
                                                P1__reg2   =  P1__t  -  P1__m  ;
                                            3 :
                                                P1__reg3   =  P1__t  -  P1__m  ;
                                            default :
                                                ;
                                        endcase
                                    end
                                    1 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        P1__reg2   =  P1__reg3  ;
                                        P1__reg3   =  P1__m  ;
                                    end
                                    2 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =  P1__m  ;
                                            1 :
                                                P1__reg1   =  P1__m  ;
                                            2 :
                                                P1__reg2   =  P1__m  ;
                                            3 :
                                                P1__reg3   =  P1__m  ;
                                            default :
                                                ;
                                        endcase
                                    end
                                    3 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =  P1__m  ;
                                            1 :
                                                P1__reg1   =  P1__m  ;
                                            2 :
                                                P1__reg2   =  P1__m  ;
                                            3 :
                                                P1__reg3   =  P1__m  ;
                                            default :
                                                ;
                                        endcase
                                    end
                                    4 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =(  P1__r  +  P1__m  )%2**30;
                                            1 :
                                                P1__reg1   =(  P1__r  +  P1__m  )%2**30;
                                            2 :
                                                P1__reg2   =(  P1__r  +  P1__m  )%2**30;
                                            3 :
                                                P1__reg3   =(  P1__r  +  P1__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    5 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =(  P1__r  +  P1__m  )%2**30;
                                            1 :
                                                P1__reg1   =(  P1__r  +  P1__m  )%2**30;
                                            2 :
                                                P1__reg2   =(  P1__r  +  P1__m  )%2**30;
                                            3 :
                                                P1__reg3   =(  P1__r  +  P1__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    6 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =(  P1__r  -  P1__m  )%2**30;
                                            1 :
                                                P1__reg1   =(  P1__r  -  P1__m  )%2**30;
                                            2 :
                                                P1__reg2   =(  P1__r  -  P1__m  )%2**30;
                                            3 :
                                                P1__reg3   =(  P1__r  -  P1__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    7 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =(  P1__r  -  P1__m  )%2**30;
                                            1 :
                                                P1__reg1   =(  P1__r  -  P1__m  )%2**30;
                                            2 :
                                                P1__reg2   =(  P1__r  -  P1__m  )%2**30;
                                            3 :
                                                P1__reg3   =(  P1__r  -  P1__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    8 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =(  P1__r  +  P1__m  )%2**30;
                                            1 :
                                                P1__reg1   =(  P1__r  +  P1__m  )%2**30;
                                            2 :
                                                P1__reg2   =(  P1__r  +  P1__m  )%2**30;
                                            3 :
                                                P1__reg3   =(  P1__r  +  P1__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    9 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =(  P1__r  -  P1__m  )%2**30;
                                            1 :
                                                P1__reg1   =(  P1__r  -  P1__m  )%2**30;
                                            2 :
                                                P1__reg2   =(  P1__r  -  P1__m  )%2**30;
                                            3 :
                                                P1__reg3   =(  P1__r  -  P1__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    10 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =(  P1__r  +  P1__m  )%2**30;
                                            1 :
                                                P1__reg1   =(  P1__r  +  P1__m  )%2**30;
                                            2 :
                                                P1__reg2   =(  P1__r  +  P1__m  )%2**30;
                                            3 :
                                                P1__reg3   =(  P1__r  +  P1__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    11 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__m   =  P1__tail  ;
                                            1 :
                                            begin
                                                P1__m   =  P1__datai  ;
                                                P1__addr   <=  P1__tail  ;
                                                P1__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg1  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                            3 :
                                            begin
                                                P1__addr   <=(  P1__tail  +  P1__reg2  )%2**20;
                                                P1__rd   <=1'b1;
                                                P1__m   =  P1__datai  ;
                                            end
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =(  P1__r  -  P1__m  )%2**30;
                                            1 :
                                                P1__reg1   =(  P1__r  -  P1__m  )%2**30;
                                            2 :
                                                P1__reg2   =(  P1__r  -  P1__m  )%2**30;
                                            3 :
                                                P1__reg3   =(  P1__r  -  P1__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    12 :
                                    begin
                                        case (  P1__mf  )
                                            0 :
                                                P1__t   =  P1__r  /2;
                                            1 :
                                            begin
                                                P1__t   =  P1__r  /2;
                                                if (  P1__B  ==1'b1)
                                                    P1__t   =  P1__t  %2**29;
                                            end
                                            2 :
                                                P1__t   =(  P1__r  %2**29)*2;
                                            3 :
                                            begin
                                                P1__t   =(  P1__r  %2**29)*2;
                                                if (  P1__t  >2**30-1)
                                                    P1__B   =1'b1;
                                                else
                                                    P1__B   =1'b0;
                                            end
                                            default :
                                                ;
                                        endcase
                                        case (  P1__d  )
                                            0 :
                                                P1__reg0   =  P1__t  ;
                                            1 :
                                                P1__reg1   =  P1__t  ;
                                            2 :
                                                P1__reg2   =  P1__t  ;
                                            3 :
                                                P1__reg3   =  P1__t  ;
                                            default :
                                                ;
                                        endcase
                                    end
                                    13 ,14,15:
                                        ;
                                endcase
                            end
                            else
                                if (  P1__df  ==7)
                                begin
                                    case (  P1__mf  )
                                        0 :
                                            P1__m   =  P1__tail  ;
                                        1 :
                                            P1__m   =  P1__tail  ;
                                        2 :
                                            P1__m   =(  P1__reg1  %2**20)+(  P1__tail  %2**20);
                                        3 :
                                            P1__m   =(  P1__reg2  %2**20)+(  P1__tail  %2**20);
                                    endcase
                                    P1__addr   <=  P1__m  %2*20;
                                    P1__wr   <=1'b1;
                                    P1__datao   <=  P1__r  ;
                                end
                    endcase
                    P1__state   =  P1__FETCH  ;
                end
            endcase
        end
    end

    assign P1__clock = clock;
    assign P1__reset = reset;
    assign ad1 = P1__addr;
    assign P1__datai = di1;
    assign do1 = P1__datao;
    assign r1 = P1__rd;
    assign w1 = P1__wr;


    wire  P2__clock;
    wire  P2__reset;
    reg [19:0] P2__addr;
    wire [31:0] P2__datai;
    integer P2__datao;
    reg  P2__rd;
    reg  P2__wr;

    always @(  posedge    P2__clock          or  posedge   P2__reset  )
    begin :  P2__xhdl1
        integer  P2__reg0  ;
        integer  P2__reg1  ;
        integer  P2__reg2  ;
        integer  P2__reg3  ;
        reg  P2__B  ;
        reg[19:0]  P2__MAR  ;
        integer  P2__MBR  ;
        reg[1:0]  P2__mf  ;
        reg[2:0]  P2__df  ;
        reg[0:0]  P2__cf  ;
        reg[3:0]  P2__ff  ;
        reg[19:0]  P2__tail  ;
        integer  P2__IR  ;
        reg[0:0]  P2__state  ;
        integer  P2__r  ;
        integer  P2__m  ;
        integer  P2__t  ;
        integer  P2__d  ;
        integer  P2__temp  ;
        reg[1:0]  P2__s  ;
        if (  P2__reset  ==1'b1)
        begin
            P2__MAR   =0;
            P2__MBR   =0;
            P2__IR   =0;
            P2__d   =0;
            P2__r   =0;
            P2__m   =0;
            P2__s   =0;
            P2__temp   =0;
            P2__mf   =0;
            P2__df   =0;
            P2__ff   =0;
            P2__cf   =0;
            P2__tail   =0;
            P2__B   =1'b0;
            P2__reg0   =0;
            P2__reg1   =0;
            P2__reg2   =0;
            P2__reg3   =0;
            P2__addr   <=0;
            P2__rd   <=1'b0;
            P2__wr   <=1'b0;
            P2__datao   <=0;
            P2__state   =  P2__FETCH  ;
        end
        else
        begin
            P2__rd   <=1'b0;
            P2__wr   <=1'b0;
            case (  P2__state  )
                P2__FETCH   :
                begin
                    P2__MAR   =  P2__reg3  %2**20;
                    P2__addr   <=  P2__MAR  ;
                    P2__rd   <=1'b1;
                    P2__MBR   =  P2__datai  ;
                    P2__IR   =  P2__MBR  ;
                    P2__state   =  P2__EXEC  ;
                end
                P2__EXEC   :
                begin
                    if (  P2__IR  <0)
                        P2__IR   =-  P2__IR  ;
                    P2__mf   =(  P2__IR  /2**27)%4;
                    P2__df   =(  P2__IR  /2**24)%2**3;
                    P2__ff   =(  P2__IR  /2**19)%2**4;
                    P2__cf   =(  P2__IR  /2**23)%2;
                    P2__tail   =  P2__IR  %2**20;
                    P2__reg3   =((  P2__reg3  %2**29)+8);
                    P2__s   =(  P2__IR  /2**29)%4;
                    case (  P2__s  )
                        0 :
                            P2__r   =  P2__reg0  ;
                        1 :
                            P2__r   =  P2__reg1  ;
                        2 :
                            P2__r   =  P2__reg2  ;
                        3 :
                            P2__r   =  P2__reg3  ;
                    endcase
                    case (  P2__cf  )
                        1 :
                        begin
                            case (  P2__mf  )
                                0 :
                                    P2__m   =  P2__tail  ;
                                1 :
                                begin
                                    P2__m   =  P2__datai  ;
                                    P2__addr   <=  P2__tail  ;
                                    P2__rd   <=1'b1;
                                end
                                2 :
                                begin
                                    P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                    P2__rd   <=1'b1;
                                    P2__m   =  P2__datai  ;
                                end
                                3 :
                                begin
                                    P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                    P2__rd   <=1'b1;
                                    P2__m   =  P2__datai  ;
                                end
                            endcase
                            case (  P2__ff  )
                                0 :
                                    if (  P2__r  <  P2__m  )
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                1 :
                                    if (~(  P2__r  <  P2__m  ))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                2 :
                                    if (  P2__r  ==  P2__m  )
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                3 :
                                    if (~(  P2__r  ==  P2__m  ))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                4 :
                                    if (~(  P2__r  >  P2__m  ))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                5 :
                                    if (  P2__r  >  P2__m  )
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                6 :
                                begin
                                    if (  P2__r  >2**30-1)
                                        P2__r   =  P2__r  -2**30;
                                    if (  P2__r  <  P2__m  )
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                end
                                7 :
                                begin
                                    if (  P2__r  >2**30-1)
                                        P2__r   =  P2__r  -2**30;
                                    if (~(  P2__r  <  P2__m  ))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                end
                                8 :
                                    if ((  P2__r  <  P2__m  )|(  P2__B  ==1'b1))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                9 :
                                    if ((~(  P2__r  <  P2__m  ))|(  P2__B  ==1'b1))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                10 :
                                    if ((  P2__r  ==  P2__m  )|(  P2__B  ==1'b1))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                11 :
                                    if ((~(  P2__r  ==  P2__m  ))|(  P2__B  ==1'b1))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                12 :
                                    if ((~(  P2__r  >  P2__m  ))|(  P2__B  ==1'b1))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                13 :
                                    if ((  P2__r  >  P2__m  )|(  P2__B  ==1'b1))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                14 :
                                begin
                                    if (  P2__r  >2**30-1)
                                        P2__r   =  P2__r  -2**30;
                                    if ((  P2__r  <  P2__m  )|(  P2__B  ==1'b1))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                end
                                15 :
                                begin
                                    if (  P2__r  >2**30-1)
                                        P2__r   =  P2__r  -2**30;
                                    if ((~(  P2__r  <  P2__m  ))|(  P2__B  ==1'b1))
                                        P2__B   =1'b1;
                                    else
                                        P2__B   =1'b0;
                                end
                            endcase
                        end
                        0 :
                            if (~(  P2__df  ==7))
                            begin
                                if (  P2__df  ==5)
                                begin
                                    if ((~(  P2__B  ))==1'b1)
                                        P2__d   =3;
                                end
                                else
                                    if (  P2__df  ==4)
                                    begin
                                        if (  P2__B  ==1'b1)
                                            P2__d   =3;
                                    end
                                    else
                                        if (  P2__df  ==3)
                                            P2__d   =3;
                                        else
                                            if (  P2__df  ==2)
                                                P2__d   =2;
                                            else
                                                if (  P2__df  ==1)
                                                    P2__d   =1;
                                                else
                                                    if (  P2__df  ==0)
                                                        P2__d   =0;
                                case (  P2__ff  )
                                    0 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        P2__t   =0;
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =  P2__t  -  P2__m  ;
                                            1 :
                                                P2__reg1   =  P2__t  -  P2__m  ;
                                            2 :
                                                P2__reg2   =  P2__t  -  P2__m  ;
                                            3 :
                                                P2__reg3   =  P2__t  -  P2__m  ;
                                            default :
                                                ;
                                        endcase
                                    end
                                    1 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        P2__reg2   =  P2__reg3  ;
                                        P2__reg3   =  P2__m  ;
                                    end
                                    2 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =  P2__m  ;
                                            1 :
                                                P2__reg1   =  P2__m  ;
                                            2 :
                                                P2__reg2   =  P2__m  ;
                                            3 :
                                                P2__reg3   =  P2__m  ;
                                            default :
                                                ;
                                        endcase
                                    end
                                    3 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =  P2__m  ;
                                            1 :
                                                P2__reg1   =  P2__m  ;
                                            2 :
                                                P2__reg2   =  P2__m  ;
                                            3 :
                                                P2__reg3   =  P2__m  ;
                                            default :
                                                ;
                                        endcase
                                    end
                                    4 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =(  P2__r  +  P2__m  )%2**30;
                                            1 :
                                                P2__reg1   =(  P2__r  +  P2__m  )%2**30;
                                            2 :
                                                P2__reg2   =(  P2__r  +  P2__m  )%2**30;
                                            3 :
                                                P2__reg3   =(  P2__r  +  P2__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    5 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =(  P2__r  +  P2__m  )%2**30;
                                            1 :
                                                P2__reg1   =(  P2__r  +  P2__m  )%2**30;
                                            2 :
                                                P2__reg2   =(  P2__r  +  P2__m  )%2**30;
                                            3 :
                                                P2__reg3   =(  P2__r  +  P2__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    6 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =(  P2__r  -  P2__m  )%2**30;
                                            1 :
                                                P2__reg1   =(  P2__r  -  P2__m  )%2**30;
                                            2 :
                                                P2__reg2   =(  P2__r  -  P2__m  )%2**30;
                                            3 :
                                                P2__reg3   =(  P2__r  -  P2__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    7 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =(  P2__r  -  P2__m  )%2**30;
                                            1 :
                                                P2__reg1   =(  P2__r  -  P2__m  )%2**30;
                                            2 :
                                                P2__reg2   =(  P2__r  -  P2__m  )%2**30;
                                            3 :
                                                P2__reg3   =(  P2__r  -  P2__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    8 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =(  P2__r  +  P2__m  )%2**30;
                                            1 :
                                                P2__reg1   =(  P2__r  +  P2__m  )%2**30;
                                            2 :
                                                P2__reg2   =(  P2__r  +  P2__m  )%2**30;
                                            3 :
                                                P2__reg3   =(  P2__r  +  P2__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    9 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =(  P2__r  -  P2__m  )%2**30;
                                            1 :
                                                P2__reg1   =(  P2__r  -  P2__m  )%2**30;
                                            2 :
                                                P2__reg2   =(  P2__r  -  P2__m  )%2**30;
                                            3 :
                                                P2__reg3   =(  P2__r  -  P2__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    10 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =(  P2__r  +  P2__m  )%2**30;
                                            1 :
                                                P2__reg1   =(  P2__r  +  P2__m  )%2**30;
                                            2 :
                                                P2__reg2   =(  P2__r  +  P2__m  )%2**30;
                                            3 :
                                                P2__reg3   =(  P2__r  +  P2__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    11 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__m   =  P2__tail  ;
                                            1 :
                                            begin
                                                P2__m   =  P2__datai  ;
                                                P2__addr   <=  P2__tail  ;
                                                P2__rd   <=1'b1;
                                            end
                                            2 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg1  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                            3 :
                                            begin
                                                P2__addr   <=(  P2__tail  +  P2__reg2  )%2**20;
                                                P2__rd   <=1'b1;
                                                P2__m   =  P2__datai  ;
                                            end
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =(  P2__r  -  P2__m  )%2**30;
                                            1 :
                                                P2__reg1   =(  P2__r  -  P2__m  )%2**30;
                                            2 :
                                                P2__reg2   =(  P2__r  -  P2__m  )%2**30;
                                            3 :
                                                P2__reg3   =(  P2__r  -  P2__m  )%2**30;
                                            default :
                                                ;
                                        endcase
                                    end
                                    12 :
                                    begin
                                        case (  P2__mf  )
                                            0 :
                                                P2__t   =  P2__r  /2;
                                            1 :
                                            begin
                                                P2__t   =  P2__r  /2;
                                                if (  P2__B  ==1'b1)
                                                    P2__t   =  P2__t  %2**29;
                                            end
                                            2 :
                                                P2__t   =(  P2__r  %2**29)*2;
                                            3 :
                                            begin
                                                P2__t   =(  P2__r  %2**29)*2;
                                                if (  P2__t  >2**30-1)
                                                    P2__B   =1'b1;
                                                else
                                                    P2__B   =1'b0;
                                            end
                                            default :
                                                ;
                                        endcase
                                        case (  P2__d  )
                                            0 :
                                                P2__reg0   =  P2__t  ;
                                            1 :
                                                P2__reg1   =  P2__t  ;
                                            2 :
                                                P2__reg2   =  P2__t  ;
                                            3 :
                                                P2__reg3   =  P2__t  ;
                                            default :
                                                ;
                                        endcase
                                    end
                                    13 ,14,15:
                                        ;
                                endcase
                            end
                            else
                                if (  P2__df  ==7)
                                begin
                                    case (  P2__mf  )
                                        0 :
                                            P2__m   =  P2__tail  ;
                                        1 :
                                            P2__m   =  P2__tail  ;
                                        2 :
                                            P2__m   =(  P2__reg1  %2**20)+(  P2__tail  %2**20);
                                        3 :
                                            P2__m   =(  P2__reg2  %2**20)+(  P2__tail  %2**20);
                                    endcase
                                    P2__addr   <=  P2__m  %2**20;
                                    P2__wr   <=1'b1;
                                    P2__datao   <=  P2__r  ;
                                end
                    endcase
                    P2__state   =  P2__FETCH  ;
                end
            endcase
        end
    end

    assign P2__clock = clock;
    assign P2__reset = reset;
    assign ad2 = P2__addr;
    assign P2__datai = di2;
    assign do2 = P2__datao;
    assign r2 = P2__rd;
    assign w2 = P2__wr;

    always @(         ad1 or  ad2 or  r1 or  r2 or  w1 or  w2 or  do1 or  do2 or  si)
    begin
        so <=(ad1+ad2)%2**20;
        rd <=r1^(~r2);
        wr <=w1^(~w2);
        if ((ad1<2**19&ad2<2**19&r1==1'b0)|(ad1>2**19-1&ad2>2**19-1&r2==1'b0))
        begin
            di1 <=do2+si;
            di2 <=do1;
        end
        else
        begin
            di1 <=do2;
            di2 <=do1+si;
        end
    end

endmodule
