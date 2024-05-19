// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "game_config.vh"

`default_nettype none 

module risk_sprite_engine
#(
    parameter NUM_SPRITE  = 1,
    parameter DX_WIDTH = 4,
    parameter DY_WIDTH = 4
)

//----------------------------------------------------------------------------
//
//  REG_CONTROL     - управление спрайтами
//          7:0     SPRITE_NUM      :   0-254, номер спрайта, 255 - VGA_STATUS
//          10:8    SEL             :   Выбор значения
//                                      000 - X,  001 - Y
//                                      010 - DX, 011 - DY
//          11      START           :   1 - разрешение автоматического обновления координат
//
//  Поле SEL автоматически увеличивается на 1 после каждой записи в REG_WDATA
//
//  REG_WDATA      - запись координат при REG_CONTROL[SPRITE_NUM] в диапазоне от 0 до 254
//          11:0     VAL            : новое значение координаты, зависит от поля REG_CONTROL[SEL]
//
//  REG_RDATA      - чтение координат при REG_CONTROL[SPRITE_NUM] в диапазоне от 0 до 254
//          11:0     VAL            : новое значение координаты, зависит от поля REG_CONTROL[SEL]
//
//  REG_WDATA      - запись координат при REG_CONTROL[SPRITE_NUM]=255
//          11:0     -              : резерв
//
//  REG_RDATA      - чтение состояния
//          0       VSYNQ           : 1 - начало отображения нового фрейма
//          31:1    -               : резерв, значение равно 0
(
    input  wire                         clk,
    input  wire                         reset,      //!  1 - сброс

    output wire  [              NUM_SPRITE-1:0]        sprite_write_xy,   //! 1 - запись координат спрайта
    output wire  [              NUM_SPRITE-1:0]        sprite_write_dxy,  //! 1 - запись приращения координат спрайта
    output wire  [`X_WIDTH *    NUM_SPRITE- 1:0]       sprite_write_x,    //! координата X спрайта; запись при sprite_write_xy==1
    output wire  [`Y_WIDTH *    NUM_SPRITE- 1:0]       sprite_write_y,    //! координата Y спрайта; запись при sprite_write_xy==1
    output wire  [ DX_WIDTH *   NUM_SPRITE- 1:0]       sprite_write_dx,   //! приращение координаты X спрайта; запись при sprite_write_dxy==1
    output wire  [ DY_WIDTH *   NUM_SPRITE- 1:0]       sprite_write_dy,   //! приращение координаты Y спрайта; запись при sprite_write_dxy==1
    output wire  [              NUM_SPRITE-1:0]        sprite_enable_update,  //! 1 - разрешение обновления координат спрайта через приращение
    input  wire  [`X_WIDTH *    NUM_SPRITE- 1:0]       sprite_x,       //! текущая координата X спрайта
    input  wire  [`Y_WIDTH *    NUM_SPRITE- 1:0]       sprite_y,       //! текущая координата Y спрайта
    
    input wire [31:0]                   vcu_reg_control,            //! control register for video control unit (vcu)  
    input wire                          vcu_reg_control_we,         //! 1 - new data in the vcu_reg_control
    input wire [31:0]                   vcu_reg_wdata,              //! data register for video control unit (vcu)
    input wire                          vcu_reg_wdata_we,           //! 1 - new data in the vcu_reg_wdata
    output wire [31:0]                  vcu_reg_rdata,              //! input data 

    input wire                          vsync                  //! 1 - идёт отображение

);

reg           vsync_z;
reg           flag_new_vsync;
reg [2:0]     sel;

reg [NUM_SPRITE-1:0]                    sprite_write_xy_i;   // 1 - запись координат спрайта
reg [NUM_SPRITE * `X_WIDTH   - 1:0]     sprite_write_x_i;    // координата X спрайта, запись при sprite_write_xy==1
reg [NUM_SPRITE * `Y_WIDTH   - 1:0]     sprite_write_y_i;    // координата Y спрайта, запись при sprite_write_xy==1



always @(posedge clk)   vsync_z <= #1 vsync;

always @(posedge clk) begin
        if( reset || (vcu_reg_control_we && vcu_reg_control[7:0]==8'hFF ))
            flag_new_vsync <= #1 0;
        else if( vsync_z && ~vsync )
            flag_new_vsync <= #1 1;
end    
    
reg [31:0] vcu_reg_rdata_i;
assign vcu_reg_rdata = vcu_reg_rdata_i;

always @(posedge clk) begin
    if( reset )
        sel <= #1 0;
    else if( vcu_reg_control_we ) 
        sel <= #1 vcu_reg_control[10:8];
    else if( vcu_reg_wdata_we )
        sel <= #1 sel + 1;
end

always @(vcu_reg_control, flag_new_vsync) begin
    if( vcu_reg_control[7:0]==8'hFF )
        vcu_reg_rdata_i <= { 31'h0, flag_new_vsync };
    // else if( vcu_reg_control[7:0]<NUM_SPRITE ) 
    //     case( sel )
    //         0: vcu_reg_rdata_i <= sprite_x[vcu_reg_control[7:0]]; 
    //         1: vcu_reg_rdata_i <= sprite_y[vcu_reg_control[7:0]]; 
    //         default:
    //             vcu_reg_rdata_i <= '0;
    //     endcase
    else
        vcu_reg_rdata_i <= 0;
end

genvar  ii;
generate


    for( ii=0; ii<NUM_SPRITE; ii=ii+1 ) begin : gen_sprite
    
        always @(posedge clk) begin
            if( vcu_reg_wdata_we && vcu_reg_control[7:0]==ii ) begin

                case( sel )
                    0: sprite_write_x_i[(ii+1)*`X_WIDTH-1:ii*`X_WIDTH] <= #1 vcu_reg_wdata[`X_WIDTH   - 1:0];
                    1: sprite_write_y_i[(ii+1)*`X_WIDTH-1:ii*`Y_WIDTH] <= #1 vcu_reg_wdata[`Y_WIDTH   - 1:0];
                endcase

            end

            if( 3'b001==sel && vcu_reg_wdata_we && vcu_reg_control[7:0]==ii )
                sprite_write_xy_i[ii] <= #1 1;    // обновление координат производится при записи Y
            else
                sprite_write_xy_i[ii] <= #1 0;

        end




    
    end



endgenerate    

assign sprite_write_xy = sprite_write_xy_i;
assign sprite_write_x  = sprite_write_x_i;
assign sprite_write_y  = sprite_write_y_i;


assign sprite_write_dxy = 0;
assign sprite_write_dx = 0;
assign sprite_write_dy = 0;
assign sprite_enable_update = 0;


endmodule

`default_nettype wire