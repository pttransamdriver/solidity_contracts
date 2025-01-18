const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Example_Functions", function () {
  let exampleFunctions;
  let owner;

  // Deploy the contract before each test
  beforeEach(async function () {
    const Example_Functions = await ethers.getContractFactory("Example_Functions");
    exampleFunctions = await Example_Functions.deploy();
    [owner] = await ethers.getSigners();
  });

  describe("Name Operations", function () {
    it("should return the default name initially", async function () {
      const name = await exampleFunctions.getName();
      expect(name).to.equal("Example_Default_name");
    });

    it("should set a new name correctly", async function () {
      await exampleFunctions.setName("New Test Name");
      const name = await exampleFunctions.getName();
      expect(name).to.equal("New Test Name");
    });

    it("should reset name to default", async function () {
      // First change the name
      await exampleFunctions.setName("New Test Name");
      
      // Then reset it
      await exampleFunctions.resetName();
      
      // Verify it's back to default
      const name = await exampleFunctions.getName();
      expect(name).to.equal("Example_Default_name");
    });
  });
});
