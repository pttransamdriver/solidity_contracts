const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Types2', ()=> {
  beforeEach(async ()=> {
    const Contract = await ethers.getContractFactory('Type_dev');
    contract = await Contract.deploy();
  })

  describe('Example 1', ()=> {
    it('demonstrates boolean values', async ()=> {
      expect(await contract.example1()).to.equal(true);
    })
  })
})