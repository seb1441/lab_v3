import ApplicationController from './application_controller'
import Sortable from 'sortablejs';
import Rails from '@rails/ujs';

export default class extends ApplicationController {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this),
      animation: 150,
      filter: '.sort-disabled',
      preventOnFilter: false,
    })
  }

  end(event) {
    let data = new FormData()
    data.append('position', event.newIndex)

    const id = event.item.dataset.id

    Rails.ajax({
      url: this.data.get('url').replace(':id', id),
      type: 'PATCH',
      data: data
    })
  }
}