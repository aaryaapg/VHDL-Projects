--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:05:22 05/20/2020
-- Design Name:   
-- Module Name:   E:/FPGA/Xilinx ISE Projects/BCDtoXS3/bcd_TB.vhd
-- Project Name:  BCDtoXS3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BCDtoXS
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY bcd_TB IS
END bcd_TB;
 
ARCHITECTURE behavior OF bcd_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BCDtoXS
    PORT(
         B : IN  std_logic_vector(3 downto 0);
         X : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal X : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCDtoXS PORT MAP (
          B => B,
          X => X
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		B<="0000";
		wait for 10 ns;
		B<="0111";
		wait for 10 ns;
		B<="0101";
		wait for 10 ns;
		B<="1111";

      -- insert stimulus here 

      wait;
   end process;

END;
