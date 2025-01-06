const { expect } = require('chai');
const { ethers } = require('hardhat');

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

const ether = tokens

describe('Variables', () => {
  it('it has a state variable with a default value', async () => {
    const Contract = await ethers.getContractFactory('Variables1')
    let variables = await Contract.deploy()
    expect(await variables.deployed()).to.equal('Example 1')
  })
})

describe('Example 2', () => {
  it('it has a state variable with a default value', async () => {
    const Contract = await ethers.getContractFactory('Variables2')
    let variables = await Contract.deploy('Example 2')
    expect(await variables.deployed()).to.equal('Example 2')
  })
})