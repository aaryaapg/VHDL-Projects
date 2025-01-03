--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:44:10 05/19/2020
-- Design Name:   
-- Module Name:   E:/FPGA/Xilinx ISE Projects/DecadeCounter/DecadeCounter_tb.vhd
-- Project Name:  DecadeCounter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DecadeCounter
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
 
ENTITY DecadeCounter_tb IS
END DecadeCounter_tb;
 
ARCHITECTURE behavior OF DecadeCounter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DecadeCounter
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         clk_out : OUT  std_logic;
         count_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal clk_out : std_logic;
   signal count_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DecadeCounter PORT MAP (
          clk => clk,
          rst => rst,
          clk_out => clk_out,
          count_out => count_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
rst <= '1';
wait for 100 ns;
rst <= '0';
      wait;
   end process;

END;
