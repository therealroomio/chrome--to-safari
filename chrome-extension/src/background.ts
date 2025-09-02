chrome.action.onClicked.addListener(async (tab) => {
  const url = tab.url;
  if (!url) {
    console.warn('No URL found for the active tab.');
    return;
  }
  try {
    await chrome.runtime.sendNativeMessage('com.roomio.opensafari', { url });
    console.log(`Requested Safari to open: ${url}`);
  } catch (err) {
    console.error('Failed to send native message:', err);
  }
});
