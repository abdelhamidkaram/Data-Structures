import 'linked_list_impl.dart';
import 'linked_list_node.dart';

class LinkedListIterator {
  LinkListNode? _currentNode;
  LinkedListIterator(node) {
    this._currentNode = node;
  }

  data() {
    return this._currentNode!.data;
  }

  LinkedListIterator next() {
    this._currentNode = this._currentNode?.next;
    return this;
  }

  LinkListNode? current() {
    return this._currentNode;
  }
}
