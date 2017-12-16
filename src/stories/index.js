import React from 'react';
import BigCalendar from 'react-big-calendar';
import moment from 'moment';
import ExpansionPanel from 'material-expansion-panel';
import { storiesOf } from '@storybook/react';
import { withInfo } from '@storybook/addon-info';
import { action } from '@storybook/addon-actions';

import Navigation from '../view/Navigation';
import StatusFilter from '../view/StatusFilter';
import Avatar from '../view/Avatar';
import Toolbar from '../view/Toolbar';
import TimePicker from '../view/TimePicker';
import InputBox from '../view/InputBox';
import BreadCrumb from '../view/Breadcrumb';
import AvailabilityInput from '../view/AvailabilityInput';
import AvaliabilityForm from '../view/forms/AvailabilityForm';
import CreateUserForm from '../view/forms/CreateUserForm';

import 'react-big-calendar/lib/css/react-big-calendar.css';
import 'material-expansion-panel/dist/material-expansion-panel.min.css';

BigCalendar.momentLocalizer(moment);
storiesOf('InputBox', module)
  .addDecorator((story, context) =>
    withInfo(`
  A basic Input box
  `)(story)(context)
  )
  .add('Basic', () => (
    <InputBox name="title" onChange={action('form submitted')} />
  ));

storiesOf('CreateUserForm', module)
  .addDecorator((story, context) =>
    withInfo(`
  CreateUserForm
  `)(story)(context)
  )
  .add('Basic', () => <CreateUserForm onSubmit={action('form submitted')} />);

storiesOf('AvaliabilityForm', module)
  .addDecorator((story, context) =>
    withInfo(`
  An form for entering Availability
  `)(story)(context)
  )
  .add('Basic', () => (
    <AvaliabilityForm onChange={action('availability changed')} />
  ));

storiesOf('AvailabilityInput', module)
  .addDecorator((story, context) =>
    withInfo(`
    An input form for entering Availability
    `)(story)(context)
  )
  .add('Basic', () => (
    <AvailabilityInput onChange={action('availability changed')} />
  ));

storiesOf('BreadCrumb', module)
  .addDecorator((story, context) =>
    withInfo(`
    A Breadcrumb for progressing through steps
    `)(story)(context)
  )
  .add('Basic', () => (
    <BreadCrumb>
      <li>Select User</li>
      <li>Enter Address</li>
      <li>Assign Driver</li>
      <li>Verify ride</li>
    </BreadCrumb>
  ));

storiesOf('TimePicker', module)
  .addDecorator((story, context) =>
    withInfo(`
    A Time picker for picking a specific time
    `)(story)(context)
  )
  .add('Basic', () => <TimePicker />);

storiesOf('Navigation', module)
  .addDecorator((story, context) =>
    withInfo(`
    A component for navigating between different views
    `)(story)(context)
  )
  .add('Dispatcher', () => <Navigation isDispatcher={true} />)
  .add('Driver', () => <Navigation isDriver={true} />)
  .add('Passanger', () => <Navigation />);

storiesOf('StatusFilter', module)
  .addDecorator((story, context) =>
    withInfo(`
    A filter for rides
    `)(story)(context)
  )
  .add('Default', () => <StatusFilter />)
  .add('Dispatcher', () => <StatusFilter isDispatcher={true} />);

storiesOf('Avatar', module)
  .addDecorator((story, context) =>
    withInfo(`
    A Circle with Initials in the center used to identify users uniquely.
    `)(story)(context)
  )
  .add('Example', () => <Avatar name="Brett Lamy" />)
  .add('Small', () => <Avatar name="NT" size={24} />)
  .add('Extra Small', () => <Avatar name="MM" size={16} />)
  .add('Large', () => <Avatar name="MM" size={56} />);

storiesOf('Toolbar', module)
  .addDecorator((story, context) =>
    withInfo(`
    An AppBar which contains a search field, hamburger menu, title and avatar
    `)(story)(context)
  )
  .add('Dispatcher', () => <Toolbar isDispatcher={true} />)
  .add('Driver', () => <Toolbar isDriver={true} />)
  .add('Passanger', () => <Toolbar />);

storiesOf('Calendar', module)
  .addDecorator((story, context) =>
    withInfo(`
    Examples of react big cal
    `)(story)(context)
  )
  .add('Basic', () => (
    <BigCalendar
      startAccessor="start"
      endAccessor="end"
      events={[
        {
          title: 'All Day Event very long title',
          allDay: true,
          start: new Date(2017, 11, 11),
          end: new Date(2017, 11, 11)
        },
        {
          title: 'Long Event',
          start: new Date(2017, 11, 11, 2, 45, 0),
          end: new Date(2017, 11, 11, 3, 0, 0)
        }
      ]}
    />
  ));

const aIcons = [
  {
    icon: 'delete',
    callback: null,
    additionalParams: null
  }
];
const aButtons = [
  {
    buttonText: 'Save',
    callback: null,
    additionalParams: null
  },
  {
    buttonText: 'Cancel',
    callback: null,
    additionalParams: null,
    toggleExpand: true
  }
];

storiesOf('Expandable Card', module)
  .addDecorator((story, context) =>
    withInfo(`
    A Listview which expands on item click
    `)(story)(context)
  )
  .add('Single', () => (
    <ExpansionPanel
      title="Title"
      expandedTitle="Expanded Title"
      titleIcon="done_all"
      actionButtons={aButtons}
      actionIcons={aIcons}
    >
      <div>Example Content</div>
    </ExpansionPanel>
  ))
  .add('List', () => (
    <div>
      <ExpansionPanel
        titleIcon="done_all"
        title="Panel Title"
        expandedTitle="Expanded Panel Title"
      />
      <ExpansionPanel
        titleIcon="done_all"
        title="Panel Title"
        expandedTitle="Expanded Panel Title"
        actionButtons={aButtons}
        actionIcons={aIcons}
      >
        Content
      </ExpansionPanel>
      <ExpansionPanel
        titleIcon="done_all"
        title="Panel Title"
        expandedTitle="Expanded Panel Title"
      />
    </div>
  ));
