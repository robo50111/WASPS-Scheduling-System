import React from 'react';
import BigCalendar from 'react-big-calendar';
import moment from 'moment';
import ExpansionPanel from 'material-expansion-panel';
import { storiesOf } from '@storybook/react';
import { withInfo } from '@storybook/addon-info';
import { action } from '@storybook/addon-actions';
import StoryRouter from 'storybook-router';
import styled, { injectGlobal } from 'styled-components';

import Navigation from '../controller/Navigation';
import StatusFilter from '../view/StatusFilter';
import Avatar from '../view/Avatar';
import Toolbar from '../view/Toolbar';
import TimePicker from '../view/TimePicker';
import InputBox from '../view/InputBox';
import BreadCrumb, { Crumb } from '../view/Breadcrumb';
import AvailabilityInput from '../view/AvailabilityInput';
// import AvaliabilityForm from '../view/forms/AvailabilityForm';
// import CreateUserForm from '../view/forms/CreateUserForm';
// import PlacesSearchBox from '../view/PlacesSearchbox';
// import GoogleRoutesForm from '../view/forms/GoogleRoutesForm';
// import FindUsers from '../view/FindUsers';
import TimeSelectorDropdown from '../view/TimeSelectorDropdown';
import AvailableDrivers from '../view/AvailableDrivers';
import AssignedDriver from '../view/AssignedDriver';
import AcceptRide from '../view/AcceptRide';
import DriverProfile from '../view/DriverProfile';
import EditProfile from '../view/EditProfile';
import UserMenu from '../view/UserMenu';

import 'react-big-calendar/lib/css/react-big-calendar.css';
import 'material-expansion-panel/dist/material-expansion-panel.min.css';

BigCalendar.momentLocalizer(moment);

const FullBleed = styled.div`
  height: 100%;
  width: 100%;
  position: absolute;
`;
injectGlobal`
  #root, #root>div, #root>div>div {
    height: 100%;
    width: 100%;
    position: absolute;
  }
`;

storiesOf('EditProfile', module)
  .addDecorator((story, context) =>
    withInfo(`
			Find a User View
		`)(story)(context)
  )
  .add('Basic', () => (
    <EditProfile
      onSave={action('On Save')}
      onCancel={action('change cancelled')}
    />
  ));

storiesOf('Edit', module)
  .addDecorator((story, context) =>
    withInfo(`
			Find a User View
		`)(story)(context)
  )
  .add('Basic', () => (
    <UserMenu
      users={['Niharika Nakka']}
      goToEditProfile={action('edit profile')}
      logout={action('logging out')}
    />
  ));

storiesOf('AvailableDrivers', module)
  .addDecorator((story, context) =>
    withInfo(`
			Find a User View
		`)(story)(context)
  )
  .add('Basic', () => (
    <AvailableDrivers
      onReply={action('replied')}
      phone="585-111-1234"
      origin="1900 empire blvd, Webster, NY"
      destination="55 North Ave, Webster, NY"
      drivers={['Niharika Nakka', 'Brett Lamy', 'Mohammad Suhail']}
    />
  ));

storiesOf('AssignedDriver', module)
  .addDecorator((story, context) =>
    withInfo(`
			Find a User View
		`)(story)(context)
  )
  .add('Basic', () => (
    <AssignedDriver
      onReply={action('replied')}
      phone="585-789-9812"
      origin="1900 empire blvd, Webster, NY"
      destination="55 North Ave, Webster, NY"
      users={['Niharika Nakka']}
    />
  ));

storiesOf('AcceptRide', module)
  .addDecorator((story, context) =>
    withInfo(`
			Find a User View
		`)(story)(context)
  )
  .add('Basic', () => (
    <AcceptRide
      users={['Niharika Nakka']}
      onReply={action('replied')}
      onAccept={action('Ride Accepted')}
      onDecline={action('Ride Declined')}
      phone="585-583-5839"
      origin="1900 empire blvd, Webster, NY"
      destination="55 North Ave, Webster, NY"
    />
  ));

storiesOf('DriverProfile', module)
  .addDecorator((story, context) =>
    withInfo(`
			Find a User View
		`)(story)(context)
  )
  .add('Basic', () => <DriverProfile />);

storiesOf('TimeSelectorDropdown', module)
  .addDecorator((story, context) =>
    withInfo(`
			Find a User View
		`)(story)(context)
  )
  .add('Basic', () => <TimeSelectorDropdown />);

// storiesOf('FindUsers', module)
//   .addDecorator((story, context) =>
//     withInfo(`
//       Find a User View
//     `)(story)(context)
//   )
//   .add('Basic', () => (
//     <FindUsers
//       users={['Brett Lamy', 'Foo Bar']}
//       onSearchChanged={action('searchChanged')}
//     />
//   ));

storiesOf('PlacesSearchBox', module)
  .addDecorator((story, context) =>
    withInfo(`
      Google places autocomplete
    `)(story)(context)
  )
  .add('Basic', () => (
    <PlacesSearchBox title="title" onAddressPicked={action('address Picked')} />
  ));

// storiesOf('GoogleRoutesForm', module)
//   .addDecorator((story, context) =>
//     withInfo(`
//         Google places autocomplete
//       `)(story)(context)
//   )
//   .add('Basic', () => (
//     <FullBleed>
//       <GoogleRoutesForm
//         apiKey="AIzaSyBvobiFxMVC72Zbd2YmfcxawWMpwG_QLKs"
//         onOriginChanged={action('onOriginChanged')}
//         onDestinationChanged={action('onDestinationChanged')}
//         onRouteChanged={action('onRouteChanged')}
//       />
//     </FullBleed>
//   ));

storiesOf('InputBox', module)
  .addDecorator((story, context) =>
    withInfo(`
  A basic Input box
  `)(story)(context)
  )
  .add('Basic', () => (
    <InputBox name="title" onChange={action('form submitted')} />
  ));

// storiesOf('CreateUserForm', module)
//   .addDecorator((story, context) =>
//     withInfo(`
//   CreateUserForm
//   `)(story)(context)
//   )
//   .add('Basic', () => <CreateUserForm onSubmit={action('form submitted')} />);

// storiesOf('AvaliabilityForm', module)
//   .addDecorator((story, context) =>
//     withInfo(`
//   An form for entering Availability
//   `)(story)(context)
//   )
//   .add('Basic', () => (
//     <AvaliabilityForm onChange={action('availability changed')} />
//   ));

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
      <Crumb done>User</Crumb>
      <Crumb active>Route</Crumb>
      <Crumb>Driver</Crumb>
      <Crumb>Verify</Crumb>
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
  .addDecorator(StoryRouter())
  .addDecorator((story, context) =>
    withInfo(`
    A component for navigating between different views
    `)(story)(context)
  )
  .add('Dispatcher', () => <Navigation userRole={'dispatcher'} />)
  .add('Driver', () => <Navigation userRole={'driver'} />)
  .add('Passanger', () => <Navigation />);

storiesOf('StatusFilter', module)
  .addDecorator((story, context) =>
    withInfo(`
    A filter for rides
    `)(story)(context)
  )
  .add('Default', () => <StatusFilter />)
  .add('Dispatcher', () => <StatusFilter userRole={'dispatcher'} />);

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
  .add('Dispatcher', () => (
    <Toolbar
      onMenuToggle={action('menu clicked')}
      onAvatarClick={action('avatar click')}
      userRole={'dispatcher'}
      goToEditProfile={action('edit profile clicked')}
      logout={action('logout clicked')}
    />
  ))
  .add('Driver', () => (
    <Toolbar
      onMenuToggle={action('menu clicked')}
      onAvatarClick={action('avatar click')}
      userRole={'driver'}
      goToEditProfile={action('edit profile clicked')}
      logout={action('logout clicked')}
    />
  ))
  .add('Passanger', () => (
    <Toolbar
      onAvatarClick={action('avatar click')}
      onMenuToggle={action('menu clicked')}
      goToEditProfile={action('edit profile clicked')}
      logout={action('logout clicked')}
    />
  ));

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
