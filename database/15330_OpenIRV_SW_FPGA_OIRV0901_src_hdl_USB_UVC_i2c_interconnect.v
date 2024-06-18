// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: i2c_interconnect.v
 *  Purpose:  Current module allows to connect I2C devices inside and outside
 *            of the FPGA to each other at the same I2C bus.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module i2c_interconnect
(
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S0_IIC SCL_I" *)    output  wire    s0_scl_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S0_IIC SCL_O" *)    input   wire    s0_scl_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S0_IIC SCL_T" *)    input   wire    s0_scl_t,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S0_IIC SDA_I" *)    output  wire    s0_sda_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S0_IIC SDA_O" *)    input   wire    s0_sda_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S0_IIC SDA_T" *)    input   wire    s0_sda_t,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S1_IIC SCL_I" *)    output  wire    s1_scl_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S1_IIC SCL_O" *)    input   wire    s1_scl_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S1_IIC SCL_T" *)    input   wire    s1_scl_t,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S1_IIC SDA_I" *)    output  wire    s1_sda_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S1_IIC SDA_O" *)    input   wire    s1_sda_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 S1_IIC SDA_T" *)    input   wire    s1_sda_t,

    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 M_IIC SCL_I" *)     input   wire    m_scl_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 M_IIC SCL_O" *)     output  wire    m_scl_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 M_IIC SCL_T" *)     output  wire    m_scl_t,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 M_IIC SDA_I" *)     input   wire    m_sda_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 M_IIC SDA_O" *)     output  wire    m_sda_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 M_IIC SDA_T" *)     output  wire    m_sda_t
);

/*-------------------------------------------------------------------------------------------------------------------------------------*/ 

    assign s0_scl_i = m_scl_i;
    assign s1_scl_i = m_scl_i;
    
    assign s0_sda_i = m_sda_i;
    assign s1_sda_i = m_sda_i;
    
    assign m_scl_o = s0_scl_o & s1_scl_o;
    assign m_scl_t = s0_scl_t & s1_scl_t;
    
    assign m_sda_o = s0_sda_o & s1_sda_o;
    assign m_sda_t = s0_sda_t & s1_sda_t;
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
