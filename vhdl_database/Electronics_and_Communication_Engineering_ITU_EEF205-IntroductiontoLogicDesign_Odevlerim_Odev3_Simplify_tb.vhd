
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Simplify_tb IS
END Simplify_tb;
 
ARCHITECTURE Behavioral OF Simplify_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Simplify
    PORT(
         X : IN  std_logic;
         Y : IN  std_logic;
         Z : IN  std_logic;
         T : IN  std_logic;
         W : IN  std_logic;
         OUTA : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic := '0';
   signal Y : std_logic := '0';
   signal Z : std_logic := '0';
   signal T : std_logic := '0';
   signal W : std_logic := '0';

 	--Outputs
   signal OUTA : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   DUT:Simplify PORT MAP (
          X => X,
          Y => Y,
          Z => Z,
          T => T,
          W => W,
          OUTA => OUTA
        );

   -- Stimulus process
   stim_proc: process
   begin
    --00000--0
    X <= '0';
    Y <= '0';
    Z <= '0';
    T <= '0';
    W <= '0';
    wait for 10ns;

    --00001--1
    X <= '0';
    Y <= '0';
    Z <= '0';
    T <= '0';
    W <= '1';
    wait for 10ns;

    --00010--2
    X <= '0';
    Y <= '0';
    Z <= '0';
    T <= '1';
    W <= '0';
    wait for 10ns;
    
    --00011--3
    X <= '0';
    Y <= '0';
    Z <= '0';
    T <= '1';
    W <= '1';
    wait for 10ns;    

    --00100--4
    X <= '0';
    Y <= '0';
    Z <= '1';
    T <= '0';
    W <= '0';
    wait for 10ns;

    --00101--5
    X <= '0';
    Y <= '0';
    Z <= '1';
    T <= '0';
    W <= '1';
    wait for 10ns;

    --00110--6
    X <= '0';
    Y <= '0';
    Z <= '1';
    T <= '1';
    W <= '0';
    wait for 10ns;
    
    --00111--7
    X <= '0';
    Y <= '0';
    Z <= '1';
    T <= '1';
    W <= '1';
    wait for 10ns;    
    
    --01000--8
    X <= '0';
    Y <= '1';
    Z <= '0';
    T <= '0';
    W <= '0';
    wait for 10ns;  
    --01001--9
    X <= '0';
    Y <= '1';
    Z <= '0';
    T <= '0';
    W <= '1';
    wait for 10ns;

    --01010--10
    X <= '0';
    Y <= '1';
    Z <= '0';
    T <= '1';
    W <= '0';
    wait for 10ns;

    --01011--11
    X <= '0';
    Y <= '1';
    Z <= '0';
    T <= '1';
    W <= '1';
    wait for 10ns;
    
    --01100--12
    X <= '0';
    Y <= '1';
    Z <= '1';
    T <= '0';
    W <= '0';
    wait for 10ns;    
    
    --01101--13
    X <= '0';
    Y <= '1';
    Z <= '1';
    T <= '0';
    W <= '1';
    wait for 10ns;
      
    --01110--14
    X <= '0';
    Y <= '1';
    Z <= '1';
    T <= '1';
    W <= '0';
    wait for 10ns;

    --01111--15
    X <= '0';
    Y <= '1';
    Z <= '1';
    T <= '1';
    W <= '1';
    wait for 10ns;

    --10000--16
    X <= '1';
    Y <= '0';
    Z <= '0';
    T <= '0';
    W <= '0';
    wait for 10ns;
    
    --10001--17
    X <= '1';
    Y <= '0';
    Z <= '0';
    T <= '0';
    W <= '1';
    wait for 10ns;    
    
    --10010--18
    X <= '1';
    Y <= '0';
    Z <= '0';
    T <= '1';
    W <= '0';
    wait for 10ns;  
    
    --10011--19
    X <= '1';
    Y <= '0';
    Z <= '0';
    T <= '1';
    W <= '1';
    wait for 10ns;

    --10100--20
    X <= '1';
    Y <= '0';
    Z <= '1';
    T <= '0';
    W <= '0';
    wait for 10ns;

    --10101--21
    X <= '1';
    Y <= '0';
    Z <= '1';
    T <= '0';
    W <= '1';
    wait for 10ns;
    
    --10110--22
    X <= '1';
    Y <= '0';
    Z <= '1';
    T <= '1';
    W <= '0';
    wait for 10ns;    
    
    --10111--23
    X <= '1';
    Y <= '0';
    Z <= '1';
    T <= '1';
    W <= '1';
    wait for 10ns;  

    --11000--24
    X <= '1';
    Y <= '1';
    Z <= '0';
    T <= '0';
    W <= '0';
    wait for 10ns;

    --11001--25
    X <= '1';
    Y <= '1';
    Z <= '0';
    T <= '0';
    W <= '1';
    wait for 10ns;

    --11010--26
    X <= '1';
    Y <= '1';
    Z <= '0';
    T <= '1';
    W <= '0';
    wait for 10ns;
    
    --11011--27
    X <= '1';
    Y <= '1';
    Z <= '0';
    T <= '1';
    W <= '1';
    wait for 10ns;    
    
    --11100--28
    X <= '1';
    Y <= '1';
    Z <= '1';
    T <= '0';
    W <= '0';
    wait for 10ns;  
    
    --11101--29
    X <= '1';
    Y <= '1';
    Z <= '1';
    T <= '0';
    W <= '1';
    wait for 10ns;

    --11110--30
    X <= '1';
    Y <= '1';
    Z <= '1';
    T <= '1';
    W <= '0';
    wait for 10ns;

    --11111--31
    X <= '1';
    Y <= '1';
    Z <= '1';
    T <= '1';
    W <= '1';
    wait for 10ns;
    

      wait;
   end process;
end;
