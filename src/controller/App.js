import React, { Component } from 'react';
import styled from 'styled-components';
import Toolbar from '../view/Toolbar';
import Navigation from '../view/Navigation';
import StatusFilter from '../view/StatusFilter';
import ExpansionPanel from 'material-expansion-panel';
import { Add } from '../view/icons';
import CreateRide from './CreateRide';

const Fullbleed = styled.div`
  postion: absolute:
  width: 100%;
  height: 100%;
`;
const Body = styled.div`
  display: flex;
`;
const ExpansionList = styled.div`
  width: 100%;
  margin: 20px 60px;
`;
const FAB = styled.button`
  padding: 20px;
  background-color: #f2c94c;
  border-radius: 100%;
  position: absolute;
  right: 20px;
  bottom: 20px;
  transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 10px, rgba(0, 0, 0, 0.23) 0px 3px 10px;
  border: none;
  :focus {
    outline: 0;
  }
`;

export default class App extends Component {
  state = {
    sidebarIsOpen: true,
    isDispatcher: false,
    isDriver: false,
    statusFilter: '',
    createRideIsOpen: false
  };

  toggleSidebar = () => {
    this.setState(({ sidebarIsOpen }) => ({ sidebarIsOpen: !sidebarIsOpen }));
  };

  toggleCreateRide = () => {
    this.setState(({ createRideIsOpen }) => ({
      createRideIsOpen: !createRideIsOpen
    }));
  };

  render() {
    const {
      sidebarIsOpen,
      isDispatcher,
      isDriver,
      statusFilter,
      createRideIsOpen
    } = this.state;
    return (
      <Fullbleed>
        <Toolbar title="Passanger" onMenuToggle={() => this.toggleSidebar()} />
        <Body>
          {sidebarIsOpen && (
            <div>
              <Navigation isDispatcher={isDispatcher} isDriver={isDriver} />
              <hr />
              <StatusFilter
                isDispatcher={isDispatcher}
                isDriver={isDriver}
                status={statusFilter}
              />
            </div>
          )}
          <ExpansionList>
            <ExpansionPanel
              titleIcon="done_all"
              title="Panel Title"
              expandedTitle="Expanded Panel Title"
            />
            <ExpansionPanel
              titleIcon="done_all"
              title="Panel Title"
              expandedTitle="Expanded Panel Title"
            >
              Content
            </ExpansionPanel>
            <ExpansionPanel
              titleIcon="done_all"
              title="Panel Title"
              expandedTitle="Expanded Panel Title"
            />
          </ExpansionList>
        </Body>
        <FAB onClick={this.toggleCreateRide}>
          <Add />
        </FAB>
        {createRideIsOpen && (
          <CreateRide onModalClick={this.toggleCreateRide} />
        )}
      </Fullbleed>
    );
  }
}
