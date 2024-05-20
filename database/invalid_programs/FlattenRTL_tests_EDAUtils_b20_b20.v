// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module b20(
        clock,
        reset,
        si,
        so,
        rd,
        wr
    );
    parameter \P1.FETCH   = 0;
    parameter \P1.EXEC   = 1;
    parameter \P2.FETCH   = 0;
    parameter \P2.EXEC   = 1;
    input clock;
    input reset;
    input [31:0] si;
    output reg [19:0] so;
    output reg  rd;
    output reg  wr;
    wire [19:0] addr_1;
    wire [19:0] addr_2;
    integer datai_1;
    integer datai_2;
    wire [31:0] datao_1;
    wire [31:0] datao_2;
    wire rd_1;
    wire rd_2;
    wire wr_1;
    wire wr_2;
    wire \P1.clock ;
    wire \P1.reset ;
    reg [19:0] \P1.addr ;
    wire [31:0] \P1.datai ;
    wire \P1.datao ;
    reg  \P1.rd ;
    reg  \P1.wr ;
    wire \P2.clock ;
    wire \P2.reset ;
    reg [19:0] \P2.addr ;
    wire [31:0] \P2.datai ;
    wire \P2.datao ;
    reg  \P2.rd ;
    reg  \P2.wr ;
    always @ (  addr_1 or  addr_2 or  rd_1 or  rd_2 or  wr_1 or  wr_2 or  datao_1 or  datao_2 or  si)
    begin
        so <= ( ( addr_1 + addr_2 ) % ( 2 ** 20 ) );
        rd <= ( rd_1 ^  ~( rd_2) );
        wr <= ( wr_1 ^  ~( wr_2) );
        if ( ( ( ( addr_1 < ( 2 ** 19 ) ) & ( addr_2 < ( 2 ** 19 ) ) ) & ( rd_1 == 1'b0 ) ) | ( ( ( addr_1 > ( ( 2 ** 19 ) - 1 ) ) & ( addr_2 > ( ( 2 ** 19 ) - 1 ) ) ) & ( rd_2 == 1'b0 ) ) ) 
        begin
            datai_1 <= ( datao_2 + si );
            datai_2 <= datao_1;
        end
        else
        begin
            datai_1 <= datao_2;
            datai_2 <= ( datao_1 + si );
        end
    end
    assign \P1.clock  = clock;
    assign \P1.reset  = reset;
    assign addr_1 = \P1.addr ;
    assign \P1.datai  = datai_1;
    assign datao_1 = \P1.datao ;
    assign rd_1 = \P1.rd ;
    assign wr_1 = \P1.wr ;
    always @ (  posedge \P1.clock  or  posedge \P1.reset )
    begin : \P1.xhdl0 
        integer \P1.reg0 ;
        integer \P1.reg1 ;
        integer \P1.reg2 ;
        integer \P1.reg3 ;
        reg  \P1.B ;
        reg [19:0] \P1.MAR ;
        integer \P1.MBR ;
        reg [1:0] \P1.mf ;
        reg [2:0] \P1.df ;
        reg [0:0] \P1.cf ;
        reg [3:0] \P1.ff ;
        reg [19:0] \P1.tail ;
        integer \P1.IR ;
        reg [0:0] \P1.state ;
        integer \P1.r ;
        integer \P1.m ;
        integer \P1.t ;
        integer \P1.d ;
        integer \P1.temp ;
        reg [1:0] \P1.s ;
        parameter \P1.FETCH   = 0;
        parameter \P1.EXEC   = 1;
        if ( \P1.reset  == 1'b1 ) 
        begin
            \P1.MAR  = 0;
            \P1.MBR  = 0;
            \P1.IR  = 0;
            \P1.d  = 0;
            \P1.r  = 0;
            \P1.m  = 0;
            \P1.s  = 0;
            \P1.temp  = 0;
            \P1.mf  = 0;
            \P1.df  = 0;
            \P1.ff  = 0;
            \P1.cf  = 0;
            \P1.tail  = 0;
            \P1.B  = 1'b0;
            \P1.reg0  = 0;
            \P1.reg1  = 0;
            \P1.reg2  = 0;
            \P1.reg3  = 0;
            \P1.addr  <= 0;
            \P1.rd  <= 1'b0;
            \P1.wr  <= 1'b0;
            \P1.datao  <= 0;
            \P1.state  = \P1.FETCH ;
        end
        else
        begin
            \P1.rd  <= 1'b0;
            \P1.wr  <= 1'b0;
            case ( \P1.state  ) 
            \P1.FETCH :
            begin
                \P1.MAR  = ( \P1.reg3  % ( 2 ** 20 ) );
                \P1.addr  <= \P1.MAR ;
                \P1.rd  <= 1'b1;
                \P1.MBR  = \P1.datai ;
                \P1.IR  = \P1.MBR ;
                \P1.state  = \P1.EXEC ;
            end
            \P1.EXEC :
            begin
                if ( \P1.IR  < 0 ) 
                begin
                    \P1.IR  =  -( \P1.IR );
                end
                \P1.mf  = ( ( \P1.IR  / ( 2 ** 27 ) ) % 4 );
                \P1.df  = ( ( \P1.IR  / ( 2 ** 24 ) ) % ( 2 ** 3 ) );
                \P1.ff  = ( ( \P1.IR  / ( 2 ** 19 ) ) % ( 2 ** 4 ) );
                \P1.cf  = ( ( \P1.IR  / ( 2 ** 23 ) ) % 2 );
                \P1.tail  = ( \P1.IR  % ( 2 ** 20 ) );
                \P1.reg3  = ( ( \P1.reg3  % ( 2 ** 29 ) ) + 8 );
                \P1.s  = ( ( \P1.IR  / ( 2 ** 29 ) ) % 4 );
                case ( \P1.s  ) 
                0:
                begin
                    \P1.r  = \P1.reg0 ;
                end
                1:
                begin
                    \P1.r  = \P1.reg1 ;
                end
                2:
                begin
                    \P1.r  = \P1.reg2 ;
                end
                3:
                begin
                    \P1.r  = \P1.reg3 ;
                end
                endcase
                case ( \P1.cf  ) 
                1:
                begin
                    case ( \P1.mf  ) 
                    0:
                    begin
                        \P1.m  = \P1.tail ;
                    end
                    1:
                    begin
                        \P1.m  = \P1.datai ;
                        \P1.addr  <= \P1.tail ;
                        \P1.rd  <= 1'b1;
                    end
                    2:
                    begin
                        \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                        \P1.rd  <= 1'b1;
                        \P1.m  = \P1.datai ;
                    end
                    3:
                    begin
                        \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                        \P1.rd  <= 1'b1;
                        \P1.m  = \P1.datai ;
                    end
                    endcase
                    case ( \P1.ff  ) 
                    0:
                    begin
                        if ( \P1.r  < \P1.m  ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    1:
                    begin
                        if (  ~( ( \P1.r  < \P1.m  )) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    2:
                    begin
                        if ( \P1.r  == \P1.m  ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    3:
                    begin
                        if (  ~( ( \P1.r  == \P1.m  )) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    4:
                    begin
                        if (  ~( ( \P1.r  > \P1.m  )) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    5:
                    begin
                        if ( \P1.r  > \P1.m  ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    6:
                    begin
                        if ( \P1.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.r  = ( \P1.r  - ( 2 ** 30 ) );
                        end
                        if ( \P1.r  < \P1.m  ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    7:
                    begin
                        if ( \P1.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.r  = ( \P1.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P1.r  < \P1.m  )) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    8:
                    begin
                        if ( ( \P1.r  < \P1.m  ) | ( \P1.B  == 1'b1 ) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    9:
                    begin
                        if (  ~( ( \P1.r  < \P1.m  )) | ( \P1.B  == 1'b1 ) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    10:
                    begin
                        if ( ( \P1.r  == \P1.m  ) | ( \P1.B  == 1'b1 ) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    11:
                    begin
                        if (  ~( ( \P1.r  == \P1.m  )) | ( \P1.B  == 1'b1 ) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    12:
                    begin
                        if (  ~( ( \P1.r  > \P1.m  )) | ( \P1.B  == 1'b1 ) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    13:
                    begin
                        if ( ( \P1.r  > \P1.m  ) | ( \P1.B  == 1'b1 ) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    14:
                    begin
                        if ( \P1.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.r  = ( \P1.r  - ( 2 ** 30 ) );
                        end
                        if ( ( \P1.r  < \P1.m  ) | ( \P1.B  == 1'b1 ) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    15:
                    begin
                        if ( \P1.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P1.r  = ( \P1.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P1.r  < \P1.m  )) | ( \P1.B  == 1'b1 ) ) 
                        begin
                            \P1.B  = 1'b1;
                        end
                        else
                        begin 
                            \P1.B  = 1'b0;
                        end
                    end
                    endcase
                end
                0:
                begin
                    if (  ~( ( \P1.df  == 7 )) ) 
                    begin
                        if ( \P1.df  == 5 ) 
                        begin
                            if (  ~( \P1.B ) == 1'b1 ) 
                            begin
                                \P1.d  = 3;
                            end
                        end
                        else
                        begin 
                            if ( \P1.df  == 4 ) 
                            begin
                                if ( \P1.B  == 1'b1 ) 
                                begin
                                    \P1.d  = 3;
                                end
                            end
                            else
                            begin 
                                if ( \P1.df  == 3 ) 
                                begin
                                    \P1.d  = 3;
                                end
                                else
                                begin 
                                    if ( \P1.df  == 2 ) 
                                    begin
                                        \P1.d  = 2;
                                    end
                                    else
                                    begin 
                                        if ( \P1.df  == 1 ) 
                                        begin
                                            \P1.d  = 1;
                                        end
                                        else
                                        begin 
                                            if ( \P1.df  == 0 ) 
                                            begin
                                                \P1.d  = 0;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        case ( \P1.ff  ) 
                        0:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            \P1.t  = 0;
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = ( \P1.t  - \P1.m  );
                            end
                            1:
                            begin
                                \P1.reg1  = ( \P1.t  - \P1.m  );
                            end
                            2:
                            begin
                                \P1.reg2  = ( \P1.t  - \P1.m  );
                            end
                            3:
                            begin
                                \P1.reg3  = ( \P1.t  - \P1.m  );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        1:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            \P1.reg2  = \P1.reg3 ;
                            \P1.reg3  = \P1.m ;
                        end
                        2:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = \P1.m ;
                            end
                            1:
                            begin
                                \P1.reg1  = \P1.m ;
                            end
                            2:
                            begin
                                \P1.reg2  = \P1.m ;
                            end
                            3:
                            begin
                                \P1.reg3  = \P1.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        3:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = \P1.m ;
                            end
                            1:
                            begin
                                \P1.reg1  = \P1.m ;
                            end
                            2:
                            begin
                                \P1.reg2  = \P1.m ;
                            end
                            3:
                            begin
                                \P1.reg3  = \P1.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        4:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.reg1  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.reg2  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.reg3  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        5:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.reg1  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.reg2  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.reg3  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        6:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.reg1  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.reg2  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.reg3  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        7:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.reg1  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.reg2  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.reg3  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        8:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.reg1  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.reg2  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.reg3  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        9:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.reg1  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.reg2  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.reg3  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        10:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.reg1  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.reg2  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.reg3  = ( ( \P1.r  + \P1.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        11:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.datai ;
                                \P1.addr  <= \P1.tail ;
                                \P1.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg1  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            3:
                            begin
                                \P1.addr  <= ( ( \P1.tail  + \P1.reg2  ) % ( 2 ** 20 ) );
                                \P1.rd  <= 1'b1;
                                \P1.m  = \P1.datai ;
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P1.reg1  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P1.reg2  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P1.reg3  = ( ( \P1.r  - \P1.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        12:
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.t  = ( \P1.r  / 2 );
                            end
                            1:
                            begin
                                \P1.t  = ( \P1.r  / 2 );
                                if ( \P1.B  == 1'b1 ) 
                                begin
                                    \P1.t  = ( \P1.t  % ( 2 ** 29 ) );
                                end
                            end
                            2:
                            begin
                                \P1.t  = ( ( \P1.r  % ( 2 ** 29 ) ) * 2 );
                            end
                            3:
                            begin
                                \P1.t  = ( ( \P1.r  % ( 2 ** 29 ) ) * 2 );
                                if ( \P1.t  > ( ( 2 ** 30 ) - 1 ) ) 
                                begin
                                    \P1.B  = 1'b1;
                                end
                                else
                                begin 
                                    \P1.B  = 1'b0;
                                end
                            end
                            default :
                            begin
                            end
                            endcase
                            case ( \P1.d  ) 
                            0:
                            begin
                                \P1.reg0  = \P1.t ;
                            end
                            1:
                            begin
                                \P1.reg1  = \P1.t ;
                            end
                            2:
                            begin
                                \P1.reg2  = \P1.t ;
                            end
                            3:
                            begin
                                \P1.reg3  = \P1.t ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        13, 
                        14, 
                        15:
                        begin
                        end
                        endcase
                    end
                    else
                    begin 
                        if ( \P1.df  == 7 ) 
                        begin
                            case ( \P1.mf  ) 
                            0:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            1:
                            begin
                                \P1.m  = \P1.tail ;
                            end
                            2:
                            begin
                                \P1.m  = ( ( \P1.reg1  % ( 2 ** 20 ) ) + ( \P1.tail  % ( 2 ** 20 ) ) );
                            end
                            3:
                            begin
                                \P1.m  = ( ( \P1.reg2  % ( 2 ** 20 ) ) + ( \P1.tail  % ( 2 ** 20 ) ) );
                            end
                            endcase
                            \P1.addr  <= ( ( \P1.m  % 2 ) * 20 );
                            \P1.wr  <= 1'b1;
                            \P1.datao  <= \P1.r ;
                        end
                    end
                end
                endcase
                \P1.state  = \P1.FETCH ;
            end
            endcase
        end
    end
    assign \P2.clock  = clock;
    assign \P2.reset  = reset;
    assign addr_2 = \P2.addr ;
    assign \P2.datai  = datai_2;
    assign datao_2 = \P2.datao ;
    assign rd_2 = \P2.rd ;
    assign wr_2 = \P2.wr ;
    always @ (  posedge \P2.clock  or  posedge \P2.reset )
    begin : \P2.xhdl1 
        integer \P2.reg0 ;
        integer \P2.reg1 ;
        integer \P2.reg2 ;
        integer \P2.reg3 ;
        reg  \P2.B ;
        reg [19:0] \P2.MAR ;
        integer \P2.MBR ;
        reg [1:0] \P2.mf ;
        reg [2:0] \P2.df ;
        reg [0:0] \P2.cf ;
        reg [3:0] \P2.ff ;
        reg [19:0] \P2.tail ;
        integer \P2.IR ;
        reg [0:0] \P2.state ;
        integer \P2.r ;
        integer \P2.m ;
        integer \P2.t ;
        integer \P2.d ;
        integer \P2.temp ;
        reg [1:0] \P2.s ;
        parameter \P2.FETCH   = 0;
        parameter \P2.EXEC   = 1;
        if ( \P2.reset  == 1'b1 ) 
        begin
            \P2.MAR  = 0;
            \P2.MBR  = 0;
            \P2.IR  = 0;
            \P2.d  = 0;
            \P2.r  = 0;
            \P2.m  = 0;
            \P2.s  = 0;
            \P2.temp  = 0;
            \P2.mf  = 0;
            \P2.df  = 0;
            \P2.ff  = 0;
            \P2.cf  = 0;
            \P2.tail  = 0;
            \P2.B  = 1'b0;
            \P2.reg0  = 0;
            \P2.reg1  = 0;
            \P2.reg2  = 0;
            \P2.reg3  = 0;
            \P2.addr  <= 0;
            \P2.rd  <= 1'b0;
            \P2.wr  <= 1'b0;
            \P2.datao  <= 0;
            \P2.state  = \P2.FETCH ;
        end
        else
        begin
            \P2.rd  <= 1'b0;
            \P2.wr  <= 1'b0;
            case ( \P2.state  ) 
            \P2.FETCH :
            begin
                \P2.MAR  = ( \P2.reg3  % ( 2 ** 20 ) );
                \P2.addr  <= \P2.MAR ;
                \P2.rd  <= 1'b1;
                \P2.MBR  = \P2.datai ;
                \P2.IR  = \P2.MBR ;
                \P2.state  = \P2.EXEC ;
            end
            \P2.EXEC :
            begin
                if ( \P2.IR  < 0 ) 
                begin
                    \P2.IR  =  -( \P2.IR );
                end
                \P2.mf  = ( ( \P2.IR  / ( 2 ** 27 ) ) % 4 );
                \P2.df  = ( ( \P2.IR  / ( 2 ** 24 ) ) % ( 2 ** 3 ) );
                \P2.ff  = ( ( \P2.IR  / ( 2 ** 19 ) ) % ( 2 ** 4 ) );
                \P2.cf  = ( ( \P2.IR  / ( 2 ** 23 ) ) % 2 );
                \P2.tail  = ( \P2.IR  % ( 2 ** 20 ) );
                \P2.reg3  = ( ( \P2.reg3  % ( 2 ** 29 ) ) - 8 );
                \P2.s  = ( ( \P2.IR  / ( 2 ** 29 ) ) % 4 );
                case ( \P2.s  ) 
                0:
                begin
                    \P2.r  = \P2.reg0 ;
                end
                1:
                begin
                    \P2.r  = \P2.reg1 ;
                end
                2:
                begin
                    \P2.r  = \P2.reg2 ;
                end
                3:
                begin
                    \P2.r  = \P2.reg3 ;
                end
                endcase
                case ( \P2.cf  ) 
                1:
                begin
                    case ( \P2.mf  ) 
                    0:
                    begin
                        \P2.m  = \P2.tail ;
                    end
                    1:
                    begin
                        \P2.m  = \P2.datai ;
                        \P2.addr  <= \P2.tail ;
                        \P2.rd  <= 1'b1;
                    end
                    2:
                    begin
                        \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                        \P2.rd  <= 1'b1;
                        \P2.m  = \P2.datai ;
                    end
                    3:
                    begin
                        \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                        \P2.rd  <= 1'b1;
                        \P2.m  = \P2.datai ;
                    end
                    endcase
                    case ( \P2.ff  ) 
                    0:
                    begin
                        if ( \P2.r  < \P2.m  ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    1:
                    begin
                        if (  ~( ( \P2.r  < \P2.m  )) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    2:
                    begin
                        if ( \P2.r  == \P2.m  ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    3:
                    begin
                        if (  ~( ( \P2.r  == \P2.m  )) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    4:
                    begin
                        if (  ~( ( \P2.r  > \P2.m  )) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    5:
                    begin
                        if ( \P2.r  > \P2.m  ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    6:
                    begin
                        if ( \P2.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.r  = ( \P2.r  - ( 2 ** 30 ) );
                        end
                        if ( \P2.r  < \P2.m  ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    7:
                    begin
                        if ( \P2.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.r  = ( \P2.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P2.r  < \P2.m  )) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    8:
                    begin
                        if ( ( \P2.r  < \P2.m  ) | ( \P2.B  == 1'b1 ) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    9:
                    begin
                        if (  ~( ( \P2.r  < \P2.m  )) | ( \P2.B  == 1'b1 ) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    10:
                    begin
                        if ( ( \P2.r  == \P2.m  ) | ( \P2.B  == 1'b1 ) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    11:
                    begin
                        if (  ~( ( \P2.r  == \P2.m  )) | ( \P2.B  == 1'b1 ) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    12:
                    begin
                        if (  ~( ( \P2.r  > \P2.m  )) | ( \P2.B  == 1'b1 ) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    13:
                    begin
                        if ( ( \P2.r  > \P2.m  ) | ( \P2.B  == 1'b1 ) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    14:
                    begin
                        if ( \P2.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.r  = ( \P2.r  - ( 2 ** 30 ) );
                        end
                        if ( ( \P2.r  < \P2.m  ) | ( \P2.B  == 1'b1 ) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    15:
                    begin
                        if ( \P2.r  > ( ( 2 ** 30 ) - 1 ) ) 
                        begin
                            \P2.r  = ( \P2.r  - ( 2 ** 30 ) );
                        end
                        if (  ~( ( \P2.r  < \P2.m  )) | ( \P2.B  == 1'b1 ) ) 
                        begin
                            \P2.B  = 1'b1;
                        end
                        else
                        begin 
                            \P2.B  = 1'b0;
                        end
                    end
                    endcase
                end
                0:
                begin
                    if (  ~( ( \P2.df  == 7 )) ) 
                    begin
                        if ( \P2.df  == 5 ) 
                        begin
                            if (  ~( \P2.B ) == 1'b1 ) 
                            begin
                                \P2.d  = 3;
                            end
                        end
                        else
                        begin 
                            if ( \P2.df  == 4 ) 
                            begin
                                if ( \P2.B  == 1'b1 ) 
                                begin
                                    \P2.d  = 3;
                                end
                            end
                            else
                            begin 
                                if ( \P2.df  == 3 ) 
                                begin
                                    \P2.d  = 3;
                                end
                                else
                                begin 
                                    if ( \P2.df  == 2 ) 
                                    begin
                                        \P2.d  = 2;
                                    end
                                    else
                                    begin 
                                        if ( \P2.df  == 1 ) 
                                        begin
                                            \P2.d  = 1;
                                        end
                                        else
                                        begin 
                                            if ( \P2.df  == 0 ) 
                                            begin
                                                \P2.d  = 0;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        case ( \P2.ff  ) 
                        0:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            \P2.t  = 0;
                            case ( \P2.d  ) 
                            0:
                            begin
                                \P2.reg0  = ( \P2.t  + \P2.m  );
                            end
                            1:
                            begin
                                \P2.reg1  = ( \P2.t  + \P2.m  );
                            end
                            2:
                            begin
                                \P2.reg2  = ( \P2.t  + \P2.m  );
                            end
                            3:
                            begin
                                \P2.reg3  = ( \P2.t  + \P2.m  );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        1:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            \P2.reg2  = \P2.reg3 ;
                            \P2.reg3  = \P2.m ;
                        end
                        2:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            case ( \P2.d  ) 
                            0:
                            begin
                                \P2.reg0  = \P2.m ;
                            end
                            1:
                            begin
                                \P2.reg1  = \P2.m ;
                            end
                            2:
                            begin
                                \P2.reg2  = \P2.m ;
                            end
                            3:
                            begin
                                \P2.reg3  = \P2.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        3:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            case ( \P2.d  ) 
                            0:
                            begin
                                \P2.reg0  = \P2.m ;
                            end
                            1:
                            begin
                                \P2.reg1  = \P2.m ;
                            end
                            2:
                            begin
                                \P2.reg2  = \P2.m ;
                            end
                            3:
                            begin
                                \P2.reg3  = \P2.m ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        4:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            case ( \P2.d  ) 
                            0:
                            begin
                                \P2.reg0  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.reg1  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.reg2  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.reg3  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        5:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            case ( \P2.d  ) 
                            0:
                            begin
                                \P2.reg0  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.reg1  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.reg2  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.reg3  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        6:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            case ( \P2.d  ) 
                            0:
                            begin
                                \P2.reg0  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.reg1  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.reg2  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.reg3  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        7:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            case ( \P2.d  ) 
                            0:
                            begin
                                \P2.reg0  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.reg1  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.reg2  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.reg3  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        8:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            case ( \P2.d  ) 
                            0:
                            begin
                                \P2.reg0  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.reg1  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.reg2  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.reg3  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        9:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            case ( \P2.d  ) 
                            0:
                            begin
                                \P2.reg0  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.reg1  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.reg2  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.reg3  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        10:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            case ( \P2.d  ) 
                            0:
                            begin
                                \P2.reg0  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.reg1  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.reg2  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            3:
                            begin
                                \P2.reg3  = ( ( \P2.r  - \P2.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        11:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            1:
                            begin
                                \P2.m  = \P2.datai ;
                                \P2.addr  <= \P2.tail ;
                                \P2.rd  <= 1'b1;
                            end
                            2:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg1  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            3:
                            begin
                                \P2.addr  <= ( ( \P2.tail  - \P2.reg2  ) % ( 2 ** 20 ) );
                                \P2.rd  <= 1'b1;
                                \P2.m  = \P2.datai ;
                            end
                            endcase
                            case ( \P2.d  ) 
                            3:
                            begin
                                \P2.reg0  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            1:
                            begin
                                \P2.reg1  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            2:
                            begin
                                \P2.reg2  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            0:
                            begin
                                \P2.reg3  = ( ( \P2.r  + \P2.m  ) % ( 2 ** 30 ) );
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        12:
                        begin
                            case ( \P2.mf  ) 
                            0:
                            begin
                                \P2.t  = ( \P2.r  / 2 );
                            end
                            3:
                            begin
                                \P2.t  = ( \P2.r  / 2 );
                                if ( \P2.B  == 1'b1 ) 
                                begin
                                    \P2.t  = ( \P2.t  % ( 2 ** 29 ) );
                                end
                            end
                            1:
                            begin
                                \P2.t  = ( ( \P2.r  % ( 2 ** 29 ) ) * 2 );
                            end
                            2:
                            begin
                                \P2.t  = ( ( \P2.r  % ( 2 ** 29 ) ) * 2 );
                                if ( \P2.t  > ( ( 2 ** 30 ) - 1 ) ) 
                                begin
                                    \P2.B  = 1'b1;
                                end
                                else
                                begin 
                                    \P2.B  = 1'b0;
                                end
                            end
                            default :
                            begin
                            end
                            endcase
                            case ( \P2.d  ) 
                            3:
                            begin
                                \P2.reg0  = \P2.t ;
                            end
                            2:
                            begin
                                \P2.reg1  = \P2.t ;
                            end
                            1:
                            begin
                                \P2.reg2  = \P2.t ;
                            end
                            0:
                            begin
                                \P2.reg3  = \P2.t ;
                            end
                            default :
                            begin
                            end
                            endcase
                        end
                        13, 
                        14, 
                        15:
                        begin
                        end
                        endcase
                    end
                    else
                    begin 
                        if ( \P2.df  == 7 ) 
                        begin
                            case ( \P2.mf  ) 
                            3:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            2:
                            begin
                                \P2.m  = \P2.tail ;
                            end
                            0:
                            begin
                                \P2.m  = ( ( \P2.reg1  % ( 2 ** 20 ) ) - ( \P2.tail  % ( 2 ** 20 ) ) );
                            end
                            1:
                            begin
                                \P2.m  = ( ( \P2.reg2  % ( 2 ** 20 ) ) - ( \P2.tail  % ( 2 ** 20 ) ) );
                            end
                            endcase
                            \P2.addr  <= ( \P2.m  % ( 2 ** 20 ) );
                            \P2.wr  <= 1'b1;
                            \P2.datao  <= \P2.r ;
                        end
                    end
                end
                endcase
                \P2.state  = \P2.FETCH ;
            end
            endcase
        end
    end
endmodule 


