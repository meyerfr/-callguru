import "bootstrap";
import { signInAs } from '../sign_in';
import {  addEventListenerToNavbarItems } from '../navbar';
import {  checkSideNavbar } from '../navbar';
import {  checkFooter } from '../footer';

signInAs();
addEventListenerToNavbarItems();
checkSideNavbar();
checkFooter();
