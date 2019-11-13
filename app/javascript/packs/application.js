import "bootstrap";
import { signInAs } from '../sign_in';
import { signOut } from '../sign_in';
import { addEventListenerToNavbarItems } from '../navbar';
import { checkSideNavbar } from '../navbar';
import { checkFooter } from '../footer';
import { showOrHidePreview } from '../agents_preview';
import { infoOnHovering } from '../hover_effect_for_info';

signInAs();
signOut();
addEventListenerToNavbarItems();
checkSideNavbar();
checkFooter();
showOrHidePreview();
infoOnHovering();
