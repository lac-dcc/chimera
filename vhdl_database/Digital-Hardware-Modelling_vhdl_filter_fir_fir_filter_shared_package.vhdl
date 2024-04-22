-- Author: Varun Nagpal
-- Net Id: vxn180010
-- VLSI Design Homework 1
-- 3rd Sept, 2018
--
-- Package: Modifiable Paramaters, non-modifiable constants and types (ports) 
--          for the Generic Nth order (L = N+1 taps) Transposed Direct-form FIR-filter 
--
-- Modifiable variables for Design of the FIR Filter:
--          FIR_ORDER   = order of the filter (N). Note L = N+1 = taps
--          X_BIT_SIZE  = bit width (n) of input samples (signed 2's complement)
--          H_BIT_SIZE  = bit width (m) of coefficients (signed 2's complement)
--
-- Modifiable variables for testbench of the FIR Filter:
--          CLK_CYCLE_TIME = clock cycle time
--          CLK_HIGH_TIME  = time for which clock is high
--
-- All remaining parameters in the package are non-modifiable constants which
-- must not be modified manually as there values are calculated during using values 
-- of modifiable variables during compilation of VHDL files

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;

package fir_filter_shared_package is
    
    -- modifiable variables for design of FIR filter
    constant FIR_ORDER		: natural := 3; 	                                	-- order of the filter (N). Note L = N+1 = taps
    constant X_BIT_SIZE  	: natural := 16;                                		-- bit width (n) of input samples (signed 2's complement)
    constant H_BIT_SIZE  	: natural := 16;                                		-- bit width (m) of coefficients (signed 2's complement)

    -- modifiable variables for testbench of FIR filter
    constant CLK_CYCLE_TIME  : time := 100 ns;
    constant CLK_HIGH_TIME   : time := 50 ns;
    
    -- modifiable constants for testbench of FIR filter
    constant CLK_LOW_TIME    : time := CLK_CYCLE_TIME - CLK_HIGH_TIME;

    -- non-modifiable constants
    constant MULT_BIT_SIZE  : natural := X_BIT_SIZE+H_BIT_SIZE;             		-- bit width (n+m) of signed multiplier
    constant EXTR_BIT_SIZE 	: natural := natural(ceil(log2(real(FIR_ORDER+1))))-1;  -- extra bits for accumulation = ceil(log2(L))-1
    constant Y_BIT_SIZE  	: natural := MULT_BIT_SIZE+EXTR_BIT_SIZE;       		-- bit width of output samples (signed 2's complement) or signed adder

    -- N = no. of register delays or additions
    subtype ADD_REG_TYPE is signed(Y_BIT_SIZE-1 downto 0);
    type ADD_REG_ARRAY is array (0 to FIR_ORDER) of ADD_REG_TYPE;

    -- L = N+1 no. of taps or coefficients or multiplications
    subtype MULT_SIG_TYPE is signed(MULT_BIT_SIZE-1 downto 0);
    type MULT_SIG_ARRAY is array (0 to FIR_ORDER) of MULT_SIG_TYPE;
    subtype COEFF_REG_TYPE is signed(H_BIT_SIZE-1 downto 0);
    type COEFF_REG_ARRAY is array (0 to FIR_ORDER) of COEFF_REG_TYPE;    

end fir_filter_shared_package;

package body fir_filter_shared_package is
    -- empty
end fir_filter_shared_package;