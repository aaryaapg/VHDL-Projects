--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:10:01 05/06/2020
-- Design Name:   
-- Module Name:   E:/FPGA/Xilinx ISE Projects/LEDSwitching/LEDSwitching_tb.vhd
-- Project Name:  LEDSwitching
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LEDSwitching
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
 
ENTITY LEDSwitching_tb IS
END LEDSwitching_tb;
 
ARCHITECTURE behavior OF LEDSwitching_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LEDSwitching
    PORT(
         Sw1 : IN  std_logic;
         Sw2 : IN  std_logic;
         led1 : OUT  std_logic;
         led2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Sw1 : std_logic := '0';
   signal Sw2 : std_logic := '0';

 	--Outputs
   signal led1 : std_logic;
   signal led2 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LEDSwitching PORT MAP (
          Sw1 => Sw1,
          Sw2 => Sw2,
          led1 => led1,
          led2 => led2
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		Sw1 <= '0';
		Sw2 <= '0';
		wait for 10 ns;
		Sw1 <= '1';
		Sw2 <= '0';
		wait for 10 ns;
		Sw1 <= '1';
		Sw2 <= '1';
		wait for 10 ns;
		Sw1 <= '0';
		Sw2 <= '1';
      wait;
   end process;

END;
